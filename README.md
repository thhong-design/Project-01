# Project-01

# Your Name

# thhong-design

1\. Added health/stat upgrade variables

&nbsp;  - Line 12: `VAR health = 5` (base health).

&nbsp;  - Line 18: `VAR has\_healed = false` (tracks whether the healing spring was used).

&nbsp;  - Line 19: `VAR has\_trained = false` (tracks whether the one-time training was used).



2\. Added inventory tracking for torches

&nbsp;  - Line 15: `VAR has\_torch = false` 

&nbsp;  - Line 14: `VAR torches = 0`



3\. Fixed torch pickup so it changes game state

&nbsp;  - torch pickup knot begins at Line 88 



4\. Cave mouth: first-visit description and inventory hint

&nbsp;  - Line 56:  ensures the long description only shows the first time.

&nbsp;  - Line 57: acknowledges whether the player has the torch.



5\. Status screen

&nbsp;  - Lines 70-79: `=== status ===` knot shows current player stats and returns to cave\_mouth.



6\. Training (upgrade) option

&nbsp;  - Lines 81-86:



7\. East tunnel / river separated into clear outcomes

&nbsp;  - Lines 99-105: shows river and gives choices that branch to separate knots.

&nbsp;  - Lines 106-112: swim-success path, reduces health by 2 and returns to cave (so player can later try the door).

&nbsp;  - Lines 113-117: swim-fail path, reduces health and ends the story.



8\. Healing spring that restores health (one-time)

&nbsp;  - Lines 126-136: 



9\. Door 

&nbsp;  - Lines 138-148: the door description mentions your color pattern, then checks health:

&nbsp;    - If health > 3 the player succeeds and is sent to `door\_success` (lines 150-154).

&nbsp;    - If health <= 3 the player is told they are too weak and returned to `cave\_mouth`. The text never says "it opens" before the strength check.



10\. Door success ending

&nbsp;   - Lines 150-154:  final treasure ending, references `pet\_name` and `color`.



&nbsp;Expected point values

\- Base assignment criteria satisfied: \*\*15 / 15\*\*

&nbsp; - At least 8 knots

&nbsp; - At least one major choice that changes ending (swim / don’t swim; door success / fail)

&nbsp; - Reflect choices back to the player (pet name, color, torch messages). 

&nbsp; - At least one loop (cave\_mouth ↔ tunnels; you can return and retry actions). 

\- Bonus points:

&nbsp; - \[+2] Include more than eight passages: \*\*+2\*\*

&nbsp; - \[+1] Inventory \& game state changes (torch presence, conditional choices): \*\*+1\*\*

&nbsp; - \[+1] Statistics \& upgrades (health + training + healing; gating the door by health): \*\*+1\*\*

&nbsp; - \[+1] Keep track of visited passages (first-visit text using `{once: ...}`): \*\*+1\*\*



\*\*TOTAL = 20 / 20\*\*



