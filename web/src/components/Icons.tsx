import * as MaterialDesign from 'react-icons/md';
import React from 'react';
import { Size } from '../store/config';

export const Icon = ({
  iconName,
  color,
}: {
  iconName: keyof typeof MaterialDesign;
  color?: string;
}) => {
  const icon = React.createElement(MaterialDesign[iconName]);
  return (
    <div style={{ color: color, fontSize: `${Size.ICON_SIZE}px` }}>{icon}</div>
  );
};
