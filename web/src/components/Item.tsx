import { ItemComponent } from '../types/item';

const Item = ({
	handleHover,
	handleClick,
	index,
	hover,
	rotate,
	item,
}: ItemComponent) => {
	const isUrl = new RegExp(
		'^(https?:\\/\\/)?' + // protocol
			'((([a-z\\d]([a-z\\d-]*[a-z\\d])*)\\.)+[a-z]{2,}|' + // domain name
			'((\\d{1,3}\\.){3}\\d{1,3}))' + // OR ip (v4) address
			'(\\:\\d+)?(\\/[-a-z\\d%_.~+]*)*' + // port and path
			'(\\?[;&a-z\\d%_.~+=-]*)?' + // query string
			'(\\#[-a-z\\d_]*)?$',
		'i'
	); // fragment locator
	return (
		<div
			onMouseEnter={() => handleHover(index)}
			className={`overflow-clip icon ${index === hover && 'active'}`}
			style={{ rotate: `${rotate}deg` }}
			onClick={() => handleClick(item)}
		>
			{item.image ? (
				<img
					src={isUrl.test(item.image) ? item.image : `images/${item.image}.png`}
					style={{ rotate: `${-rotate}deg` }}
					className="w-16 h-16"
				/>
			) : (
				<i className={`${item.icon}`} style={{ rotate: `${-rotate}deg` }}></i>
			)}
		</div>
	);
};

export default Item;
