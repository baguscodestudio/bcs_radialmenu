import React from 'react';
import styled, { css } from 'styled-components';
import { Icon } from './Icons';
import { Size, Colors, ColorsProp } from '../store/config';

// Only apply the hover effect when the menu is closed
const ButtonBase = styled.button<{
  isOpen: boolean;
  buttonsize: number;
  colors: ColorsProp;
}>`
  width: ${(p) => p.buttonsize}px;
  height: ${(p) => p.buttonsize}px;
  color: white;
  border: none;
  background-color: ${(p) =>
    p.isOpen ? p.colors.PRIMARY_2 : p.colors.PRIMARY};
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  outline: 0;
  cursor: pointer;
  transition: 0.2s ease-in-out;
  transform: scale(${(p) => (p.isOpen ? 1.03 : 1)});

  &:hover {
    background-color: ${(p) => p.colors.PRIMARY_2};
    transform: scale(1.03);
  }

  & svg {
    transition: 0.25s ease-in-out;
    transform: rotate(${(p) => (p.isOpen ? 45 : 0)}deg);
  }
`;

interface ButtonProp {
  style?: React.CSSProperties;
  isOpen: boolean;
  onClick: React.MouseEventHandler;
  className?: string;
}

type Ref = HTMLButtonElement;

const Button = React.forwardRef<Ref, ButtonProp>(function Button(
  { style, className, isOpen, onClick },
  ref
) {
  return (
    <ButtonBase
      ref={ref}
      style={style}
      className={className}
      isOpen={isOpen}
      colors={Colors}
      buttonsize={Size.BUTTON_SIZE}
      onClick={onClick}
    >
      <Icon iconName={'MdAdd'} />
    </ButtonBase>
  );
});

export default Button;
