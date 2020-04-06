import 'dart:html';
import './todo.dart';

class Utils {

	static DivElement createItemHeader(String text) {
		DivElement div = Element.div();
		div.classes.add('card__item__header');
		div.text = text;
		return div;
	}

	static DivElement createItem(Todo todo, Function delTodo) {
		DivElement card = Element.div();
		ImageElement img = Element.img();
		DivElement div = Element.div();
		var h3 = HeadingElement.h3();
		var p = ParagraphElement();
		var remove = ButtonElement();
		var span = Element.span();

		card.classes.add('card__item');
		img.width = 40;
		img.height = 40;
		img.src = './assets/dart.png';
		img.alt = 'Item';
		remove.id = todo.id.toString();
		remove.onClick.listen(delTodo);
		h3.text = todo.title.toString();
		p.text = todo.description.toString();
		div.children.add(h3);
		div.children.add(p);
		span.text = 'X';
		remove.children.add(span);

		card.children.add(img);
		card.children.add(div);
		card.children.add(remove);

		return card;
	}

}