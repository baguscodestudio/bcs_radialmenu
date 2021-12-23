import { useState } from 'react';

import { useLayer } from 'react-laag';
import './App.css';
import Button from './components/Buttons';
import Menu from './components/MenuItem';

import { AnimatePresence } from 'framer-motion';
import { useNuiEvent } from './hooks/useNuiEvent';
import { fetchNui } from './utils/fetchNui';
import { useExitListener } from './hooks/useExitListener';

export interface MenuData {
  label: string;
  icon: string;
  submenu?: MenuData[];
  event?: string;
  client?: boolean;
  args?: any[];
  shouldClose?: boolean;
}

const App = () => {
  const [isOpen, setOpen] = useState(false);
  const [radialOpen, setRadialOpen] = useState(false);
  const [items, setItems] = useState<MenuData[]>([]);
  const [home, setHome] = useState<MenuData[]>([]);

  useNuiEvent<MenuData[]>('openMenu', (data) => {
    setRadialOpen(true);
    setHome(data);
  });

  useExitListener(setRadialOpen);

  const { layerProps, triggerProps, renderLayer } = useLayer({
    isOpen,
    placement: 'center',
  });

  const handleClick = () => {
    if (isOpen) {
      setItems([]);
      setRadialOpen(false);
      fetchNui('hideFrame');
    }
    setOpen(!isOpen);
  };

  return (
    <>
      {radialOpen && (
        <>
          <Button
            className="fixed m-auto inset-0"
            {...triggerProps}
            onClick={handleClick}
            isOpen={isOpen}
          />
          {isOpen &&
            renderLayer(
              <AnimatePresence>
                {isOpen && items.length > 0 ? (
                  <Menu
                    {...layerProps}
                    setOpen={setOpen}
                    setItems={setItems}
                    setHome={setHome}
                    setRadialOpen={setRadialOpen}
                    items={items}
                  />
                ) : (
                  <Menu
                    {...layerProps}
                    setOpen={setOpen}
                    setItems={setItems}
                    setHome={setHome}
                    setRadialOpen={setRadialOpen}
                    items={home}
                  />
                )}
              </AnimatePresence>
            )}
        </>
      )}
    </>
  );
};

export default App;
