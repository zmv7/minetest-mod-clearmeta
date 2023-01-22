worldedit.register_command("clearmeta", {
	params = "",
	description = "Clear node meta in WorldEdit region",
	privs = {worldedit=true},
	require_pos = 2,
	func = function(name, node)
		local nodes = core.find_nodes_with_meta(worldedit.pos1[name], worldedit.pos2[name])
		if not nodes or nodes == {} then
			worldedit.player_notify(name, "No nodes with meta found")
			return
		end
		local count = 0
		for _,pos in ipairs(nodes) do
			local meta = pos and core.get_meta(pos)
			if meta then 
				meta:from_table()
				count = count + 1
			end
		end
		worldedit.player_notify(name, count.." nodes updated")
		return
end})

