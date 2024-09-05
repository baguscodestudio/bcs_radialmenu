import { ItemInterface } from './types/item';
import { MenuInterface } from './types/menu';

const ITEMS: ItemInterface[] = [
	{
		label: 'Car Menu',
		icon: 'fa-solid fa-car',
		menu: 'nested-menu',
	},
	{
		label: 'Interaction Menu',
		icon: 'fa-solid fa-person',
		event: 'Noooo',
	},
	{
		label: 'Clothing Menu',
		icon: 'fa-solid fa-shirt',
	},
	{
		label: 'House Menu ABC ABAC ACA',
		icon: 'fa-solid fa-house',
	},
	{
		label: 'Open Your Phone',
		icon: 'fa-solid fa-mobile-screen-button',
	},
	{
		label: 'Emote Menu',
		icon: 'fa-solid fa-face-smile',
	},
	{
		label: 'Job Menu',
		icon: 'fa-solid fa-suitcase',
	},
];

const MENU: MenuInterface[] = [
	{
		menu: 'home-menu', // Id of the menu
		isHome: true,
		options: ITEMS,
	},
	{
		menu: 'nested-menu412421',
		options: [
			{
				label: 'Job Menu',
				icon: 'fa-solid fa-suitcase',
				menu: 'nested-menu2',
			},
			{
				label: 'Gun Menu',
				icon: 'fa-solid fa-suitcase',
			},
		],
	},
	{
		menu: 'nested-menu2',
		options: [
			{
				label: 'HEHE BOI',
				icon: 'fa-solid fa-person',
			},
		],
	},
];
