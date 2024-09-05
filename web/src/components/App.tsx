import React, { useEffect, useState } from 'react';
import './App.css';
import { debugData } from '../utils/debugData';
import { useNuiEvent } from '../hooks/useNuiEvent';
import Item from './Item';
import { MenuInterface } from '../types/menu';
import { ItemInterface } from '../types/item';
import { fetchNui } from '../utils/fetchNui';
import { useVisibility } from '../providers/VisibilityProvider';

// This will set the NUI to visible if we are
// developing in browser
debugData([
	{
		action: 'setVisible',
		data: true,
	},
]);

const App: React.FC = () => {
	const [hover, setHover] = useState<number>(-1);
	const [degree, setDegree] = useState<number>(180);
	const [currentMenu, setCurrentMenu] = useState<MenuInterface>();
	const [menuHistory, setHistory] = useState<string[]>([]);
	const { visible } = useVisibility();

	useEffect(() => {
		if (visible) {
			setDegree(180);
			setHover(-1);
		}
	}, [visible]);

	useNuiEvent<MenuInterface>('setMenu', (data) => {
		let options = [...data.options];
		if (data.isHome) {
			options.unshift({
				label: 'Close',
				icon: 'fa-solid fa-xmark',
			});
		}
		setHistory([...menuHistory, data.menu]);
		setCurrentMenu({ ...data, options: options });
	});

	const handleClick = (item: ItemInterface) => {
		if (item.menu) handleMenuChange(item.menu, item.previous);
		else {
			fetchNui('itemClick', {
				index: hover,
				menu: currentMenu!.menu,
			});
			if (!item.keepOpen) fetchNui('hideFrame');
		}
	};

	const handleChange = (index: number) => {
		if (!currentMenu) return;
		let nextDeg = (360 / currentMenu.options.length) * index;
		if (Math.abs(degree - nextDeg) > Math.abs(degree - (nextDeg + 180))) {
			setDegree(nextDeg + 180);
		} else {
			setDegree(nextDeg - 180);
		}
		setHover(index);
	};

	const handleMenuChange = (menu: string, previous?: boolean) => {
		fetchNui<MenuInterface>('getMenu', menu).then((data) => {
			let options = [...data.options];
			let history = [...menuHistory];
			previous ? history.pop() : history.push(menu);
			if (!data.isHome) {
				options.unshift({
					label: 'Previous Menu',
					icon: 'fa-solid fa-arrow-left',
					menu: history[history.length - 2],
					previous: true,
				});
			} else if (data.isHome) {
				options.unshift({
					label: 'Close',
					icon: 'fa-solid fa-xmark',
				});
			}
			setHistory(history);
			setCurrentMenu({ ...data, options: options });
			setDegree(180);
			setHover(-1);
		});
	};

	return (
		<div className="nui-wrapper font-NotoSans">
			<div className="relative flex justify-center items-center w-[500px] h-[500px]">
				{currentMenu?.options.map((val, index) => (
					<Item
						key={index}
						handleHover={handleChange}
						handleClick={handleClick}
						item={val}
						index={index}
						hover={hover}
						rotate={(360 / currentMenu.options.length) * index}
					/>
				))}
				<svg
					width={500}
					height={500}
					className="transition-transform duration-300"
					style={{
						transform: `rotate(${hover >= 0 ? degree : 0}deg)`,
					}}
				>
					<defs>
						<mask id="bigmask">
							<rect width="100%" height="100%" fill="white" />
							<circle cx="250" cy="250" r="130" />
							{hover >= 0 && <circle cx="250" cy="20" r="55" />}
						</mask>
					</defs>
					<circle
						id="donut"
						cx="250"
						cy="250"
						r="250"
						mask="url(#bigmask)"
						fill="rgba(23, 23, 23, 0.70)"
					/>
				</svg>
				<div className="bg-primary w-[250px] h-[250px] rounded-full absolute-middle flex justify-center items-center text-xl text-white font-bold">
					{hover >= 0 && currentMenu?.options[hover]?.label}
				</div>
			</div>
		</div>
	);
};

export default App;
