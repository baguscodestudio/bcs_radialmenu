import React from 'react';
import styled, { css } from 'styled-components';
import { Icon } from './Icons';

// some constants
const PRIMARY = '#2ea09b';
const PRIMARY_2 = '#268e89';
const BUTTON_SIZE = 56;

// Only apply the hover effect when the menu is closed
const buttonHover = css`
  &:hover {
    background-color: ${PRIMARY_2};
    transform: scale(1.03);
  }
`;

const ButtonBase = styled.button<{ isOpen: boolean }>`
  width: ${BUTTON_SIZE}px;
  height: ${BUTTON_SIZE}px;
  color: white;
  border: none;
  background-color: ${(p) => (p.isOpen ? PRIMARY_2 : PRIMARY)};
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  outline: 0;
  cursor: pointer;
  transition: 0.2s ease-in-out;
  transform: scale(${(p) => (p.isOpen ? 1.03 : 1)});

  ${(p) => !p.isOpen && buttonHover}

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
      onClick={onClick}
    >
      <Icon iconName={'MdAdd'} />
    </ButtonBase>
  );
});

export default Button;
