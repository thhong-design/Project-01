/*
    Project 01 

    Features:
    - 14 knots
    - Inventory (torch)
    - Statistics (health) with upgrades
    - Visited passages
    - Multiple endings based on major choices
    - Loops and replayable door attempts
*/

VAR health = 5
VAR pet_name = ""
VAR torches = 0
VAR has_torch = false
VAR swim = ""
VAR color = ""
VAR has_healed = false
VAR has_trained = false

-> River

=== River ===
A voice asks... Can you swim?
* [Yes]
    ~ swim = "yes"
    -> color_question
* [No]
    ~ swim = "no"
    -> color_question
-> END

=== color_question ===
Another voice asks... What's your favorite color?
* [Red]
    ~ color = "red"
    -> memory
* [Blue]
    ~ color = "blue"
    -> memory
* [Green]
    ~ color = "green"
    -> memory
-> END

=== memory ===
Before you stands the cavern of Josh. You wish your childhood pet was with you now. The cave might be less intimidating then. What was your pet's name?

* [Charlie]
    ~ pet_name = "Charlie"
    -> cave_mouth
* [Susan]
    ~ pet_name = "Susan"
    -> cave_mouth
* [Spot]
    ~ pet_name = "Spot"
    -> cave_mouth
-> END

=== cave_mouth ===
{once: You stand at the mouth of the cavern. The air is cool and the entrance yawns before you.}
{not has_torch: There is a torch lying on the ground nearby.}
The cave extends to the east and west.

You made it to the cave. If only {pet_name} could see you now!

You have {torches} torch(es). Health: {health}.

* [Take the east tunnel] -> east_tunnel
* [Take the west tunnel] -> west_tunnel
* {not has_torch} [Pick up the torch] -> torch_pickup
* {not has_trained} [Do a quick training session to build strength (+1 health)] -> training
* [Check status] -> status
-> END

=== status ===
Player status:
- Pet: {pet_name}
- Favorite color: {color}
- Torches: {torches}
- Health: {health}
- Healed before: {has_healed}
- Trained before: {has_trained}

* [Back] -> cave_mouth
-> END

=== training ===
You take a moment to do some quick exercises to build endurance.
~ has_trained = true
~ health = health + 1
You feel a little stronger. Health is now {health}.
* [Back] -> cave_mouth
-> END

=== torch_pickup ===
~ has_torch = true
~ torches = torches + 1
You pick up the torch and sling it on your shoulder.
* [Back to cave mouth] -> cave_mouth
-> END

=== east_tunnel ===
You are in the east tunnel. It is very dark; you can't see much.
* {torches > 0} [Light a torch and look around] -> east_tunnel_lit
* [Go back] -> cave_mouth
-> END

=== east_tunnel_lit ===
You light a torch and the tunnel brightens. Far ahead you hear rushing water.
{once: The sound of water echoes through the stone, and you catch the smell of wet earth.}
* {swim == "yes"} [Approach the river and try to swim across] -> real_river_swim
* {swim != "yes"} [Approach the river and jump in anyway] -> real_river_drown
* [Go back] -> cave_mouth
-> END

=== real_river_swim ===
You battle the water and after a long, exhausting struggle you reach the other side.
~ health = health - 2
You lost 2 health. You now have {health}.
There is a small hidden tunnel that sends you back toward the surface.
* [Follow the hidden tunnel back] -> cave_mouth
-> END

=== real_river_drown ===
You dive into the river but soon realize you cannot keep yourself afloat.
~ health = health - 5
Your strength fails you. You sink beneath the waves. This is where your journey ends.
-> END

=== west_tunnel ===
You walk into the west tunnel. The passage opens into a small chamber.
{once: In the chamber you notice a carved wooden door and a faintly glowing spring to one side.}
The door is decorated with patterns of {color}.
* [Step up to the door] -> door
* [Investigate the glowing spring] -> healing_spring
* [Go back] -> cave_mouth
-> END

=== healing_spring ===
{not has_healed:
    You kneel and drink from the glowing spring. Warmth spreads through you.
    ~ has_healed = true
    ~ health = health + 2
    You feel refreshed. Health is now {health}.
    -> west_tunnel
}
{has_healed:
    The spring has already given you its gift; there is nothing more to gain here.
    -> west_tunnel
}
-> END

=== door ===
The carved door confronts you, its surface patterned in {color}.

{health > 3:
    You brace yourself and, with a heave, the door gives way. Beyond is a chamber of glittering treasure.
    You step inside and collect a small trove of artifacts. You feel a deep satisfaction.
    -> door_success
}
{health <= 3:
    You press with all your might, but the door refuses to budge. You are not strong enough yet.
    Perhaps you should rest or find another way to increase your strength.
    -> cave_mouth
}
-> END

=== door_success ===
The chamber is warm and lit by unseen lamps. On a pedestal lies an old emblem in your favorite color, {color}.
As you lift it, you think of {pet_name} and smile.
The adventure ends here; the cave will remember your name.
-> END
