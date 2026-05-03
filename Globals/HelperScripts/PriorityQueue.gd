extends Node
class_name PriorityQueue

var data = []

func is_empty() -> bool:
	return data.is_empty()

func put(item: Variant, priority: float):
	data.append({"item": item, "p": priority})
	_upheap(data.size() - 1)

func get_item() -> Variant:
	if data.size() == 0: return null
	if data.size() == 1: return data.pop_back()["item"]
	
	var root = data[0]["item"]
	data[0] = data.pop_back()
	_downheap(0)
	return root

func _upheap(idx: int):
	while idx > 0:
		var parent = (idx - 1) / 2
		if data[idx]["p"] < data[parent]["p"]:
			var temp = data[idx]
			data[idx] = data[parent]
			data[parent] = temp
			idx = parent
		else:
			break

func _downheap(idx: int):
	var size = data.size()
	while true:
		var left = 2 * idx + 1
		var right = 2 * idx + 2
		var smallest = idx
		
		if left < size and data[left]["p"] < data[smallest]["p"]:
			smallest = left
		if right < size and data[right]["p"] < data[smallest]["p"]:
			smallest = right
			
		if smallest != idx:
			var temp = data[idx]
			data[idx] = data[smallest]
			data[smallest] = temp
			idx = smallest
		else:
			break
