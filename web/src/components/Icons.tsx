import * as MaterialDesign from 'react-icons/md';
import React from 'react';

export const Icon = ({
  iconName,
  color,
}: {
  iconName: keyof typeof MaterialDesign;
  color?: string;
}) => {
  const icon = React.createElement(MaterialDesign[iconName]);
  return <div style={{ color: color }}>{icon}</div>;
};
