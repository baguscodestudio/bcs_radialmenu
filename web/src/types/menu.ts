import { ItemInterface } from './item';

export interface MenuInterface {
	menu: string;
	isHome?: boolean;
	options: ItemInterface[];
}
