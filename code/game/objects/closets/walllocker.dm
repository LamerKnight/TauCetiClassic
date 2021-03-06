//added by cael from old bs12
//not sure if there's an immediate place for secure wall lockers, but i'm sure the players will think of something

/obj/structure/closet/walllocker
	desc = "A wall mounted storage locker."
	name = "Wall Locker"
	icon = 'icons/obj/walllocker.dmi'
	icon_state = "wall-locker"
	density = 0
	anchored = 1
	wall_mounted = 1
	icon_closed = "wall-locker"
	icon_opened = "wall-lockeropen"

//spawns endless (3 sets) amounts of breathmask, emergency oxy tank and crowbar
/obj/structure/closet/walllocker/emerglocker
	name = "emergency locker"
	desc = "A wall mounted locker with emergency supplies."
	var/list/spawnitems = list(/obj/item/weapon/tank/emergency_oxygen,/obj/item/clothing/mask/breath)
	var/amount = 2 // spawns each items X times.
	icon_state = "emerg"

/obj/structure/closet/walllocker/emerglocker/update_icon() // We don't want any icons manipulation with this.
	return

/obj/structure/closet/walllocker/emerglocker/toggle(mob/user)
	src.attack_hand(user)
	return

/obj/structure/closet/walllocker/emerglocker/attackby(obj/item/weapon/W, mob/user)
	return

/obj/structure/closet/walllocker/emerglocker/attack_hand(mob/user)
	if (istype(user, /mob/living/silicon/ai))	//Added by Strumpetplaya - AI shouldn't be able to
		return									//activate emergency lockers.  This fixes that.  (Does this make sense, the AI can't call attack_hand, can it? --Mloc)
	if(!amount)
		to_chat(user, "<span class='notice'>It's empty..</span>")
		return
	if(amount)
		to_chat(user, "<span class='notice'>You take out some items from \the [src].</span>")
		for(var/path in spawnitems)
			new path(src.loc)
		amount--
	return

/obj/structure/closet/walllocker/emerglocker/north
	pixel_y = 32
	dir = SOUTH

/obj/structure/closet/walllocker/emerglocker/south
	pixel_y = -32
	dir = NORTH

/obj/structure/closet/walllocker/emerglocker/west
	pixel_x = -32
	dir = WEST

/obj/structure/closet/walllocker/emerglocker/east
	pixel_x = 32
	dir = EAST
