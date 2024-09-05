export interface ItemInterface {
	id?: string;
	label: string;
	icon?: string;
	image?: string;
	event?: string;
	menu?: string;
	keepOpen?: boolean;
	previous?: boolean;
}

export interface ItemComponent {
	handleHover: (index: number) => void;
	handleClick: (item: ItemInterface) => void;
	index: number;
	hover: number;
	rotate: number;
	item: ItemInterface;
}
