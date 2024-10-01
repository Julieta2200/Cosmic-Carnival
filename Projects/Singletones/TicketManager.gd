extends Node

var tickets_qty: int :
	set(qty):
		$qty.text = str(qty)
		tickets_qty = qty

