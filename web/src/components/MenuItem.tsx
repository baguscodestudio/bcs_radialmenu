import React, { useState } from 'react';
import * as MaterialDesign from 'react-icons/md';
import styled from 'styled-components';
// import ResizeObserver from 'resize-observer-polyfill';
import { Size, Colors, ColorsProp } from '../store/config';
import { Icon } from './Icons';

import { useLayer, useHover } from 'react-laag';
import { motion, AnimatePresence } from 'framer-motion';
import { MenuData } from '../App';
import { fetchNui } from '../utils/fetchNui';

/**
 * Positioning Stuff
 */

function getTransform(
  progress: number,
  radius: number,
  index: number,
  totalItems: number
) {
  const value = (index / totalItems) * progress;

  const x = radius * Math.cos(Math.PI * 2 * (value - 0.25));
  const y = radius * Math.sin(Math.PI * 2 * (value - 0.25));

  const scale = progress / 2 + 0.5;

  return `translate(${x}px, ${y}px) scale(${scale})`;
}

/**
 * MenuItem
 */

const TooltipBox = styled(motion.div)`
  background-color: #333;
  color: white;
  font-size: 12px;
  padding: 4px 8px;
  line-height: 1.15;
  border-radius: 3px;
`;

const Circle = styled(motion.div)<{ itemsize: number; colors: ColorsProp }>`
  position: absolute;
  width: ${(p) => p.itemsize}px;
  height: ${(p) => p.itemsize}px;
  background-color: white;
  border-radius: 50%;
  display: flex;
  justify-content: center;
  align-items: center;
  border: 1px solid ${(p) => p.colors.BORDER};
  box-shadow: 1px 1px 6px 0px rgba(0, 0, 0, 0.1);
  cursor: pointer;
  transition: box-shadow 0.15s ease-in-out, border 0.15s ease-in-out;
  color: ${(p) => p.colors.TEXT};
  pointer-events: all;
  will-change: transform;

  & svg {
    transition: 0.15s ease-in-out;
  }

  &:hover {
    box-shadow: 1px 1px 10px 0px rgba(0, 0, 0, 0.15);
    color: ${(p) => p.colors.PRIMARY};

    & svg {
      transform: scale(1.15);
    }
  }
`;

interface MenuItemProps {
  style?: React.CSSProperties;
  className?: string;
  icon: string;
  onClick: React.MouseEventHandler;
  label: string;
  index: number;
  totalItems: number;
}

function MenuItem({
  style,
  className,
  icon,
  onClick,
  label,
  index,
  totalItems,
}: MenuItemProps) {
  const [isOver, hoverProps, close] = useHover({
    delayEnter: 100,
    delayLeave: 100,
  });

  const { layerProps, triggerProps, renderLayer } = useLayer({
    isOpen: isOver,
    placement: 'top-center',
    auto: true,
    containerOffset: 16,
    triggerOffset: 6,
  });

  return (
    <>
      <Circle
        {...triggerProps}
        className={className}
        style={style}
        onClick={onClick}
        {...hoverProps}
        itemsize={Size.ITEM_SIZE}
        colors={Colors}
        initial={{ x: 0, opacity: 0 }}
        animate={{ x: 1, opacity: 1 }}
        exit={{ x: 0, opacity: 0 }}
        transformTemplate={({ x }: { x: string }) => {
          const value = parseFloat(x.replace('px', ''));
          return getTransform(value, Size.RADIUS, index, totalItems);
        }}
        transition={{
          delay: index * 0.025,
          type: 'spring',
          stiffness: 600,
          damping: 50,
          mass: 1,
        }}
      >
        <Icon iconName={icon as keyof typeof MaterialDesign} />
      </Circle>
      {isOver &&
        renderLayer(
          <AnimatePresence>
            <TooltipBox
              initial={{ opacity: 0 }}
              animate={{ opacity: 1 }}
              exit={{ opacity: 0 }}
              {...layerProps}
            >
              {label}
            </TooltipBox>
          </AnimatePresence>
        )}
    </>
  );
}

/**
 * Menu
 */

const MenuBase = styled.div<{ containersize: number }>`
  display: flex;
  justify-content: center;
  align-items: center;
  width: ${(p) => p.containersize}px;
  height: ${(p) => p.containersize}px;
  pointer-events: none;
  border-radius: 50%;
`;

interface MenuProp {
  style: React.CSSProperties;
  setOpen: React.Dispatch<React.SetStateAction<boolean>>;
  setRadialOpen: React.Dispatch<React.SetStateAction<boolean>>;
  setItems: React.Dispatch<React.SetStateAction<MenuData[]>>;
  setHome: React.Dispatch<React.SetStateAction<MenuData[]>>;
  items: MenuData[];
}

type Ref = HTMLDivElement;

const Menu = React.forwardRef<Ref, MenuProp>(function Menu(
  { style, setOpen, setRadialOpen, setItems, setHome, items },
  ref
) {
  const handleClick = (item: MenuData) => {
    if (item.shouldClose && !item.submenu) {
      setItems([]);
      setHome([]);
      setOpen(false);
      setRadialOpen(false);
      fetchNui('clickedItem', item)
        .then()
        .catch((e) => {
          console.error('Error on clickedItem', e);
        });
    } else if (item.submenu) {
      setItems(item.submenu);
      setTimeout(() => {
        setOpen(true);
      }, 500);
    } else {
      // setItems([]);
      // setHome([]);
      // setRadialOpen(false);
      fetchNui('clickedItem', item)
        .then()
        .catch((e) => {
          console.error('Error on clickedItem', e);
        });
    }
  };

  return (
    <MenuBase
      ref={ref}
      style={style}
      // onClick={() => setOpen(false)}
      containersize={Size.CONTAINER_SIZE}
    >
      {items.map((item: MenuData, index: number) => (
        <MenuItem
          key={index}
          icon={item.icon}
          label={item.label}
          onClick={() => handleClick(item)}
          index={index}
          totalItems={items.length}
        />
      ))}
    </MenuBase>
  );
});

export default Menu;
