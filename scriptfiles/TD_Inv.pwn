
//Player Textdraws:

new PlayerText:CharacterItemBackGround[MAX_PLAYERS];
new PlayerText:CharacterItemLabel[MAX_PLAYERS];
new PlayerText:ItemOne[MAX_PLAYERS];
new PlayerText:ItemTwo[MAX_PLAYERS];
new PlayerText:ItemThree[MAX_PLAYERS];
new PlayerText:ItemFour[MAX_PLAYERS];
new PlayerText:ItemFive[MAX_PLAYERS];
new PlayerText:ItemSix[MAX_PLAYERS];
new PlayerText:ItemSeven[MAX_PLAYERS];
new PlayerText:ItemEight[MAX_PLAYERS];
new PlayerText:ItemNine[MAX_PLAYERS];
new PlayerText:ItemTen[MAX_PLAYERS];
new PlayerText:ItemEleven[MAX_PLAYERS];
new PlayerText:ItemTwelve[MAX_PLAYERS];
new PlayerText:ItemThirteen[MAX_PLAYERS];
new PlayerText:ItemFourteen[MAX_PLAYERS];
new PlayerText:ItemFifthteen[MAX_PLAYERS];
new PlayerText:ItemSixteen[MAX_PLAYERS];
new PlayerText:ItemSeventeen[MAX_PLAYERS];
new PlayerText:ItemEighteen[MAX_PLAYERS];
new PlayerText:ItemNineteen[MAX_PLAYERS];
new PlayerText:ItemTwenty[MAX_PLAYERS];
new PlayerText:EmptyOne[MAX_PLAYERS];
new PlayerText:EmptyTwo[MAX_PLAYERS];
new PlayerText:EmptyThird[MAX_PLAYERS];
new PlayerText:EmptyFour[MAX_PLAYERS];
new PlayerText:EmptyFive[MAX_PLAYERS];
new PlayerText:EmptySix[MAX_PLAYERS];
new PlayerText:EmptySeven[MAX_PLAYERS];
new PlayerText:EmptyEight[MAX_PLAYERS];
new PlayerText:EmptyNine[MAX_PLAYERS];
new PlayerText:EmptyTen[MAX_PLAYERS];
new PlayerText:EmptyEleven[MAX_PLAYERS];
new PlayerText:EmptyTwelve[MAX_PLAYERS];
new PlayerText:EmptyThirdteen[MAX_PLAYERS];
new PlayerText:EmptyFourteen[MAX_PLAYERS];
new PlayerText:EmptyFifthteen[MAX_PLAYERS];
new PlayerText:EmptySixteen[MAX_PLAYERS];
new PlayerText:EmptySeventeen[MAX_PLAYERS];
new PlayerText:EmptyEighteen[MAX_PLAYERS];
new PlayerText:EmptyNineteen[MAX_PLAYERS];
new PlayerText:EmptyTwenty[MAX_PLAYERS];


CharacterItemBackGround[playerid] = CreatePlayerTextDraw(playerid, 640.400024, 109.766662, "usebox");
PlayerTextDrawLetterSize(playerid, CharacterItemBackGround[playerid], 0.000000, 19.926294);
PlayerTextDrawTextSize(playerid, CharacterItemBackGround[playerid], 468.400024, 0.000000);
PlayerTextDrawAlignment(playerid, CharacterItemBackGround[playerid], 1);
PlayerTextDrawColor(playerid, CharacterItemBackGround[playerid], 0);
PlayerTextDrawUseBox(playerid, CharacterItemBackGround[playerid], true);
PlayerTextDrawBoxColor(playerid, CharacterItemBackGround[playerid], 102);
PlayerTextDrawSetShadow(playerid, CharacterItemBackGround[playerid], 0);
PlayerTextDrawSetOutline(playerid, CharacterItemBackGround[playerid], 0);
PlayerTextDrawFont(playerid, CharacterItemBackGround[playerid], 0);

CharacterItemLabel[playerid] = CreatePlayerTextDraw(playerid, 508.799926, 111.253349, "Character Items");
PlayerTextDrawLetterSize(playerid, CharacterItemLabel[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, CharacterItemLabel[playerid], 1);
PlayerTextDrawColor(playerid, CharacterItemLabel[playerid], -1);
PlayerTextDrawSetShadow(playerid, CharacterItemLabel[playerid], 0);
PlayerTextDrawSetOutline(playerid, CharacterItemLabel[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, CharacterItemLabel[playerid], 51);
PlayerTextDrawFont(playerid, CharacterItemLabel[playerid], 1);
PlayerTextDrawSetProportional(playerid, CharacterItemLabel[playerid], 1);

ItemOne[playerid] = CreatePlayerTextDraw(playerid, 476.800079, 123.199981, "1.");
PlayerTextDrawLetterSize(playerid, ItemOne[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, ItemOne[playerid], 1);
PlayerTextDrawColor(playerid, ItemOne[playerid], -1);
PlayerTextDrawSetShadow(playerid, ItemOne[playerid], 0);
PlayerTextDrawSetOutline(playerid, ItemOne[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, ItemOne[playerid], 51);
PlayerTextDrawFont(playerid, ItemOne[playerid], 1);
PlayerTextDrawSetProportional(playerid, ItemOne[playerid], 1);

ItemTwo[playerid] = CreatePlayerTextDraw(playerid, 476.800018, 131.413314, "2.");
PlayerTextDrawLetterSize(playerid, ItemTwo[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, ItemTwo[playerid], 1);
PlayerTextDrawColor(playerid, ItemTwo[playerid], -1);
PlayerTextDrawSetShadow(playerid, ItemTwo[playerid], 0);
PlayerTextDrawSetOutline(playerid, ItemTwo[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, ItemTwo[playerid], 51);
PlayerTextDrawFont(playerid, ItemTwo[playerid], 1);
PlayerTextDrawSetProportional(playerid, ItemTwo[playerid], 1);

ItemThree[playerid] = CreatePlayerTextDraw(playerid, 477.600036, 138.879974, "3.");
PlayerTextDrawLetterSize(playerid, ItemThree[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, ItemThree[playerid], 1);
PlayerTextDrawColor(playerid, ItemThree[playerid], -1);
PlayerTextDrawSetShadow(playerid, ItemThree[playerid], 0);
PlayerTextDrawSetOutline(playerid, ItemThree[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, ItemThree[playerid], 51);
PlayerTextDrawFont(playerid, ItemThree[playerid], 1);
PlayerTextDrawSetProportional(playerid, ItemThree[playerid], 1);

ItemFour[playerid] = CreatePlayerTextDraw(playerid, 477.600311, 146.346542, "4.");
PlayerTextDrawLetterSize(playerid, ItemFour[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, ItemFour[playerid], 1);
PlayerTextDrawColor(playerid, ItemFour[playerid], -1);
PlayerTextDrawSetShadow(playerid, ItemFour[playerid], 0);
PlayerTextDrawSetOutline(playerid, ItemFour[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, ItemFour[playerid], 51);
PlayerTextDrawFont(playerid, ItemFour[playerid], 1);
PlayerTextDrawSetProportional(playerid, ItemFour[playerid], 1);

ItemFive[playerid] = CreatePlayerTextDraw(playerid, 477.600036, 153.813217, "5.");
PlayerTextDrawLetterSize(playerid, ItemFive[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, ItemFive[playerid], 1);
PlayerTextDrawColor(playerid, ItemFive[playerid], -1);
PlayerTextDrawSetShadow(playerid, ItemFive[playerid], 0);
PlayerTextDrawSetOutline(playerid, ItemFive[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, ItemFive[playerid], 51);
PlayerTextDrawFont(playerid, ItemFive[playerid], 1);
PlayerTextDrawSetProportional(playerid, ItemFive[playerid], 1);

ItemSix[playerid] = CreatePlayerTextDraw(playerid, 478.400054, 161.279953, "6.");
PlayerTextDrawLetterSize(playerid, ItemSix[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, ItemSix[playerid], 1);
PlayerTextDrawColor(playerid, ItemSix[playerid], -1);
PlayerTextDrawSetShadow(playerid, ItemSix[playerid], 0);
PlayerTextDrawSetOutline(playerid, ItemSix[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, ItemSix[playerid], 51);
PlayerTextDrawFont(playerid, ItemSix[playerid], 1);
PlayerTextDrawSetProportional(playerid, ItemSix[playerid], 1);

ItemSeven[playerid] = CreatePlayerTextDraw(playerid, 478.400085, 168.746673, "7.");
PlayerTextDrawLetterSize(playerid, ItemSeven[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, ItemSeven[playerid], 1);
PlayerTextDrawColor(playerid, ItemSeven[playerid], -1);
PlayerTextDrawSetShadow(playerid, ItemSeven[playerid], 0);
PlayerTextDrawSetOutline(playerid, ItemSeven[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, ItemSeven[playerid], 51);
PlayerTextDrawFont(playerid, ItemSeven[playerid], 1);
PlayerTextDrawSetProportional(playerid, ItemSeven[playerid], 1);

ItemEight[playerid] = CreatePlayerTextDraw(playerid, 479.200134, 176.213272, "8.");
PlayerTextDrawLetterSize(playerid, ItemEight[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, ItemEight[playerid], 1);
PlayerTextDrawColor(playerid, ItemEight[playerid], -1);
PlayerTextDrawSetShadow(playerid, ItemEight[playerid], 0);
PlayerTextDrawSetOutline(playerid, ItemEight[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, ItemEight[playerid], 51);
PlayerTextDrawFont(playerid, ItemEight[playerid], 1);
PlayerTextDrawSetProportional(playerid, ItemEight[playerid], 1);

ItemNine[playerid] = CreatePlayerTextDraw(playerid, 479.200073, 183.679885, "9.");
PlayerTextDrawLetterSize(playerid, ItemNine[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, ItemNine[playerid], 1);
PlayerTextDrawColor(playerid, ItemNine[playerid], -1);
PlayerTextDrawSetShadow(playerid, ItemNine[playerid], 0);
PlayerTextDrawSetOutline(playerid, ItemNine[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, ItemNine[playerid], 51);
PlayerTextDrawFont(playerid, ItemNine[playerid], 1);
PlayerTextDrawSetProportional(playerid, ItemNine[playerid], 1);

ItemTen[playerid] = CreatePlayerTextDraw(playerid, 474.400054, 191.146575, "10.");
PlayerTextDrawLetterSize(playerid, ItemTen[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, ItemTen[playerid], 1);
PlayerTextDrawColor(playerid, ItemTen[playerid], -1);
PlayerTextDrawSetShadow(playerid, ItemTen[playerid], 0);
PlayerTextDrawSetOutline(playerid, ItemTen[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, ItemTen[playerid], 51);
PlayerTextDrawFont(playerid, ItemTen[playerid], 1);
PlayerTextDrawSetProportional(playerid, ItemTen[playerid], 1);

ItemEleven[playerid] = CreatePlayerTextDraw(playerid, 475.200103, 198.613296, "11.");
PlayerTextDrawLetterSize(playerid, ItemEleven[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, ItemEleven[playerid], 1);
PlayerTextDrawColor(playerid, ItemEleven[playerid], -1);
PlayerTextDrawSetShadow(playerid, ItemEleven[playerid], 0);
PlayerTextDrawSetOutline(playerid, ItemEleven[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, ItemEleven[playerid], 51);
PlayerTextDrawFont(playerid, ItemEleven[playerid], 1);
PlayerTextDrawSetProportional(playerid, ItemEleven[playerid], 1);

ItemTwelve[playerid] = CreatePlayerTextDraw(playerid, 475.200134, 205.333374, "12.");
PlayerTextDrawLetterSize(playerid, ItemTwelve[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, ItemTwelve[playerid], 1);
PlayerTextDrawColor(playerid, ItemTwelve[playerid], -1);
PlayerTextDrawSetShadow(playerid, ItemTwelve[playerid], 0);
PlayerTextDrawSetOutline(playerid, ItemTwelve[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, ItemTwelve[playerid], 51);
PlayerTextDrawFont(playerid, ItemTwelve[playerid], 1);
PlayerTextDrawSetProportional(playerid, ItemTwelve[playerid], 1);

ItemThirteen[playerid] = CreatePlayerTextDraw(playerid, 475.200134, 212.799987, "13.");
PlayerTextDrawLetterSize(playerid, ItemThirteen[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, ItemThirteen[playerid], 1);
PlayerTextDrawColor(playerid, ItemThirteen[playerid], -1);
PlayerTextDrawSetShadow(playerid, ItemThirteen[playerid], 0);
PlayerTextDrawSetOutline(playerid, ItemThirteen[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, ItemThirteen[playerid], 51);
PlayerTextDrawFont(playerid, ItemThirteen[playerid], 1);
PlayerTextDrawSetProportional(playerid, ItemThirteen[playerid], 1);

ItemFourteen[playerid] = CreatePlayerTextDraw(playerid, 475.200073, 220.266677, "14.");
PlayerTextDrawLetterSize(playerid, ItemFourteen[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, ItemFourteen[playerid], 1);
PlayerTextDrawColor(playerid, ItemFourteen[playerid], -1);
PlayerTextDrawSetShadow(playerid, ItemFourteen[playerid], 0);
PlayerTextDrawSetOutline(playerid, ItemFourteen[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, ItemFourteen[playerid], 51);
PlayerTextDrawFont(playerid, ItemFourteen[playerid], 1);
PlayerTextDrawSetProportional(playerid, ItemFourteen[playerid], 1);

ItemFifthteen[playerid] = CreatePlayerTextDraw(playerid, 475.200042, 227.733291, "15.");
PlayerTextDrawLetterSize(playerid, ItemFifthteen[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, ItemFifthteen[playerid], 1);
PlayerTextDrawColor(playerid, ItemFifthteen[playerid], -1);
PlayerTextDrawSetShadow(playerid, ItemFifthteen[playerid], 0);
PlayerTextDrawSetOutline(playerid, ItemFifthteen[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, ItemFifthteen[playerid], 51);
PlayerTextDrawFont(playerid, ItemFifthteen[playerid], 1);
PlayerTextDrawSetProportional(playerid, ItemFifthteen[playerid], 1);

ItemSixteen[playerid] = CreatePlayerTextDraw(playerid, 476.000061, 235.199996, "16.");
PlayerTextDrawLetterSize(playerid, ItemSixteen[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, ItemSixteen[playerid], 1);
PlayerTextDrawColor(playerid, ItemSixteen[playerid], -1);
PlayerTextDrawSetShadow(playerid, ItemSixteen[playerid], 0);
PlayerTextDrawSetOutline(playerid, ItemSixteen[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, ItemSixteen[playerid], 51);
PlayerTextDrawFont(playerid, ItemSixteen[playerid], 1);
PlayerTextDrawSetProportional(playerid, ItemSixteen[playerid], 1);

ItemSeventeen[playerid] = CreatePlayerTextDraw(playerid, 476.000091, 242.666625, "17.");
PlayerTextDrawLetterSize(playerid, ItemSeventeen[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, ItemSeventeen[playerid], 1);
PlayerTextDrawColor(playerid, ItemSeventeen[playerid], -1);
PlayerTextDrawSetShadow(playerid, ItemSeventeen[playerid], 0);
PlayerTextDrawSetOutline(playerid, ItemSeventeen[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, ItemSeventeen[playerid], 51);
PlayerTextDrawFont(playerid, ItemSeventeen[playerid], 1);
PlayerTextDrawSetProportional(playerid, ItemSeventeen[playerid], 1);

ItemEighteen[playerid] = CreatePlayerTextDraw(playerid, 476.000000, 249.386611, "18.");
PlayerTextDrawLetterSize(playerid, ItemEighteen[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, ItemEighteen[playerid], 1);
PlayerTextDrawColor(playerid, ItemEighteen[playerid], -1);
PlayerTextDrawSetShadow(playerid, ItemEighteen[playerid], 0);
PlayerTextDrawSetOutline(playerid, ItemEighteen[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, ItemEighteen[playerid], 51);
PlayerTextDrawFont(playerid, ItemEighteen[playerid], 1);
PlayerTextDrawSetProportional(playerid, ItemEighteen[playerid], 1);

ItemNineteen[playerid] = CreatePlayerTextDraw(playerid, 476.000000, 256.853302, "19.");
PlayerTextDrawLetterSize(playerid, ItemNineteen[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, ItemNineteen[playerid], 1);
PlayerTextDrawColor(playerid, ItemNineteen[playerid], -1);
PlayerTextDrawSetShadow(playerid, ItemNineteen[playerid], 0);
PlayerTextDrawSetOutline(playerid, ItemNineteen[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, ItemNineteen[playerid], 51);
PlayerTextDrawFont(playerid, ItemNineteen[playerid], 1);
PlayerTextDrawSetProportional(playerid, ItemNineteen[playerid], 1);

ItemTwenty[playerid] = CreatePlayerTextDraw(playerid, 476.000000, 264.319976, "20.");
PlayerTextDrawLetterSize(playerid, ItemTwenty[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, ItemTwenty[playerid], 1);
PlayerTextDrawColor(playerid, ItemTwenty[playerid], -1);
PlayerTextDrawSetShadow(playerid, ItemTwenty[playerid], 0);
PlayerTextDrawSetOutline(playerid, ItemTwenty[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, ItemTwenty[playerid], 51);
PlayerTextDrawFont(playerid, ItemTwenty[playerid], 1);
PlayerTextDrawSetProportional(playerid, ItemTwenty[playerid], 1);

EmptyOne[playerid] = CreatePlayerTextDraw(playerid, 486.400054, 123.199966, "Empty");
PlayerTextDrawLetterSize(playerid, EmptyOne[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, EmptyOne[playerid], 1);
PlayerTextDrawColor(playerid, EmptyOne[playerid], -1);
PlayerTextDrawSetShadow(playerid, EmptyOne[playerid], 0);
PlayerTextDrawSetOutline(playerid, EmptyOne[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, EmptyOne[playerid], 51);
PlayerTextDrawFont(playerid, EmptyOne[playerid], 1);
PlayerTextDrawSetProportional(playerid, EmptyOne[playerid], 1);

EmptyTwo[playerid] = CreatePlayerTextDraw(playerid, 486.400024, 131.413314, "Empty");
PlayerTextDrawLetterSize(playerid, EmptyTwo[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, EmptyTwo[playerid], 1);
PlayerTextDrawColor(playerid, EmptyTwo[playerid], -1);
PlayerTextDrawSetShadow(playerid, EmptyTwo[playerid], 0);
PlayerTextDrawSetOutline(playerid, EmptyTwo[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, EmptyTwo[playerid], 51);
PlayerTextDrawFont(playerid, EmptyTwo[playerid], 1);
PlayerTextDrawSetProportional(playerid, EmptyTwo[playerid], 1);

EmptyThird[playerid] = CreatePlayerTextDraw(playerid, 488.000091, 138.879943, "Empty");
PlayerTextDrawLetterSize(playerid, EmptyThird[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, EmptyThird[playerid], 1);
PlayerTextDrawColor(playerid, EmptyThird[playerid], -1);
PlayerTextDrawSetShadow(playerid, EmptyThird[playerid], 0);
PlayerTextDrawSetOutline(playerid, EmptyThird[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, EmptyThird[playerid], 51);
PlayerTextDrawFont(playerid, EmptyThird[playerid], 1);
PlayerTextDrawSetProportional(playerid, EmptyThird[playerid], 1);

EmptyFour[playerid] = CreatePlayerTextDraw(playerid, 487.999938, 146.346527, "Empty");
PlayerTextDrawLetterSize(playerid, EmptyFour[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, EmptyFour[playerid], 1);
PlayerTextDrawColor(playerid, EmptyFour[playerid], -1);
PlayerTextDrawSetShadow(playerid, EmptyFour[playerid], 0);
PlayerTextDrawSetOutline(playerid, EmptyFour[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, EmptyFour[playerid], 51);
PlayerTextDrawFont(playerid, EmptyFour[playerid], 1);
PlayerTextDrawSetProportional(playerid, EmptyFour[playerid], 1);

EmptyFive[playerid] = CreatePlayerTextDraw(playerid, 488.000091, 153.813339, "Empty");
PlayerTextDrawLetterSize(playerid, EmptyFive[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, EmptyFive[playerid], 1);
PlayerTextDrawColor(playerid, EmptyFive[playerid], -1);
PlayerTextDrawSetShadow(playerid, EmptyFive[playerid], 0);
PlayerTextDrawSetOutline(playerid, EmptyFive[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, EmptyFive[playerid], 51);
PlayerTextDrawFont(playerid, EmptyFive[playerid], 1);
PlayerTextDrawSetProportional(playerid, EmptyFive[playerid], 1);

EmptySix[playerid] = CreatePlayerTextDraw(playerid, 488.000122, 161.279983, "Empty");
PlayerTextDrawLetterSize(playerid, EmptySix[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, EmptySix[playerid], 1);
PlayerTextDrawColor(playerid, EmptySix[playerid], -1);
PlayerTextDrawSetShadow(playerid, EmptySix[playerid], 0);
PlayerTextDrawSetOutline(playerid, EmptySix[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, EmptySix[playerid], 51);
PlayerTextDrawFont(playerid, EmptySix[playerid], 1);
PlayerTextDrawSetProportional(playerid, EmptySix[playerid], 1);

EmptySeven[playerid] = CreatePlayerTextDraw(playerid, 488.000244, 168.746612, "Empty");
PlayerTextDrawLetterSize(playerid, EmptySeven[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, EmptySeven[playerid], 1);
PlayerTextDrawColor(playerid, EmptySeven[playerid], -1);
PlayerTextDrawSetShadow(playerid, EmptySeven[playerid], 0);
PlayerTextDrawSetOutline(playerid, EmptySeven[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, EmptySeven[playerid], 51);
PlayerTextDrawFont(playerid, EmptySeven[playerid], 1);
PlayerTextDrawSetProportional(playerid, EmptySeven[playerid], 1);

EmptyEight[playerid] = CreatePlayerTextDraw(playerid, 488.800140, 176.213333, "Empty");
PlayerTextDrawLetterSize(playerid, EmptyEight[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, EmptyEight[playerid], 1);
PlayerTextDrawColor(playerid, EmptyEight[playerid], -1);
PlayerTextDrawSetShadow(playerid, EmptyEight[playerid], 0);
PlayerTextDrawSetOutline(playerid, EmptyEight[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, EmptyEight[playerid], 51);
PlayerTextDrawFont(playerid, EmptyEight[playerid], 1);
PlayerTextDrawSetProportional(playerid, EmptyEight[playerid], 1);

EmptyNine[playerid] = CreatePlayerTextDraw(playerid, 490.400054, 183.679916, "Empty");
PlayerTextDrawLetterSize(playerid, EmptyNine[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, EmptyNine[playerid], 1);
PlayerTextDrawColor(playerid, EmptyNine[playerid], -1);
PlayerTextDrawSetShadow(playerid, EmptyNine[playerid], 0);
PlayerTextDrawSetOutline(playerid, EmptyNine[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, EmptyNine[playerid], 51);
PlayerTextDrawFont(playerid, EmptyNine[playerid], 1);
PlayerTextDrawSetProportional(playerid, EmptyNine[playerid], 1);

EmptyTen[playerid] = CreatePlayerTextDraw(playerid, 490.400085, 191.146682, "Empty");
PlayerTextDrawLetterSize(playerid, EmptyTen[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, EmptyTen[playerid], 1);
PlayerTextDrawColor(playerid, EmptyTen[playerid], -1);
PlayerTextDrawSetShadow(playerid, EmptyTen[playerid], 0);
PlayerTextDrawSetOutline(playerid, EmptyTen[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, EmptyTen[playerid], 51);
PlayerTextDrawFont(playerid, EmptyTen[playerid], 1);
PlayerTextDrawSetProportional(playerid, EmptyTen[playerid], 1);

EmptyEleven[playerid] = CreatePlayerTextDraw(playerid, 490.400054, 198.613327, "Empty");
PlayerTextDrawLetterSize(playerid, EmptyEleven[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, EmptyEleven[playerid], 1);
PlayerTextDrawColor(playerid, EmptyEleven[playerid], -1);
PlayerTextDrawSetShadow(playerid, EmptyEleven[playerid], 0);
PlayerTextDrawSetOutline(playerid, EmptyEleven[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, EmptyEleven[playerid], 51);
PlayerTextDrawFont(playerid, EmptyEleven[playerid], 1);
PlayerTextDrawSetProportional(playerid, EmptyEleven[playerid], 1);

EmptyTwelve[playerid] = CreatePlayerTextDraw(playerid, 490.400115, 206.080001, "Empty");
PlayerTextDrawLetterSize(playerid, EmptyTwelve[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, EmptyTwelve[playerid], 1);
PlayerTextDrawColor(playerid, EmptyTwelve[playerid], -1);
PlayerTextDrawSetShadow(playerid, EmptyTwelve[playerid], 0);
PlayerTextDrawSetOutline(playerid, EmptyTwelve[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, EmptyTwelve[playerid], 51);
PlayerTextDrawFont(playerid, EmptyTwelve[playerid], 1);
PlayerTextDrawSetProportional(playerid, EmptyTwelve[playerid], 1);

EmptyThirdteen[playerid] = CreatePlayerTextDraw(playerid, 490.400238, 212.799942, "Empty");
PlayerTextDrawLetterSize(playerid, EmptyThirdteen[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, EmptyThirdteen[playerid], 1);
PlayerTextDrawColor(playerid, EmptyThirdteen[playerid], -1);
PlayerTextDrawSetShadow(playerid, EmptyThirdteen[playerid], 0);
PlayerTextDrawSetOutline(playerid, EmptyThirdteen[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, EmptyThirdteen[playerid], 51);
PlayerTextDrawFont(playerid, EmptyThirdteen[playerid], 1);
PlayerTextDrawSetProportional(playerid, EmptyThirdteen[playerid], 1);

EmptyFourteen[playerid] = CreatePlayerTextDraw(playerid, 490.399963, 220.266708, "Empty");
PlayerTextDrawLetterSize(playerid, EmptyFourteen[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, EmptyFourteen[playerid], 1);
PlayerTextDrawColor(playerid, EmptyFourteen[playerid], -1);
PlayerTextDrawSetShadow(playerid, EmptyFourteen[playerid], 0);
PlayerTextDrawSetOutline(playerid, EmptyFourteen[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, EmptyFourteen[playerid], 51);
PlayerTextDrawFont(playerid, EmptyFourteen[playerid], 1);
PlayerTextDrawSetProportional(playerid, EmptyFourteen[playerid], 1);

EmptyFifthteen[playerid] = CreatePlayerTextDraw(playerid, 490.399963, 227.733291, "Empty");
PlayerTextDrawLetterSize(playerid, EmptyFifthteen[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, EmptyFifthteen[playerid], 1);
PlayerTextDrawColor(playerid, EmptyFifthteen[playerid], -1);
PlayerTextDrawSetShadow(playerid, EmptyFifthteen[playerid], 0);
PlayerTextDrawSetOutline(playerid, EmptyFifthteen[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, EmptyFifthteen[playerid], 51);
PlayerTextDrawFont(playerid, EmptyFifthteen[playerid], 1);
PlayerTextDrawSetProportional(playerid, EmptyFifthteen[playerid], 1);

EmptySixteen[playerid] = CreatePlayerTextDraw(playerid, 490.399993, 234.453369, "Empty");
PlayerTextDrawLetterSize(playerid, EmptySixteen[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, EmptySixteen[playerid], 1);
PlayerTextDrawColor(playerid, EmptySixteen[playerid], -1);
PlayerTextDrawSetShadow(playerid, EmptySixteen[playerid], 0);
PlayerTextDrawSetOutline(playerid, EmptySixteen[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, EmptySixteen[playerid], 51);
PlayerTextDrawFont(playerid, EmptySixteen[playerid], 1);
PlayerTextDrawSetProportional(playerid, EmptySixteen[playerid], 1);

EmptySeventeen[playerid] = CreatePlayerTextDraw(playerid, 491.200164, 242.666641, "Empty");
PlayerTextDrawLetterSize(playerid, EmptySeventeen[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, EmptySeventeen[playerid], 1);
PlayerTextDrawColor(playerid, EmptySeventeen[playerid], -1);
PlayerTextDrawSetShadow(playerid, EmptySeventeen[playerid], 0);
PlayerTextDrawSetOutline(playerid, EmptySeventeen[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, EmptySeventeen[playerid], 51);
PlayerTextDrawFont(playerid, EmptySeventeen[playerid], 1);
PlayerTextDrawSetProportional(playerid, EmptySeventeen[playerid], 1);

EmptyEighteen[playerid] = CreatePlayerTextDraw(playerid, 491.199707, 249.386718, "Empty");
PlayerTextDrawLetterSize(playerid, EmptyEighteen[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, EmptyEighteen[playerid], 1);
PlayerTextDrawColor(playerid, EmptyEighteen[playerid], -1);
PlayerTextDrawSetShadow(playerid, EmptyEighteen[playerid], 0);
PlayerTextDrawSetOutline(playerid, EmptyEighteen[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, EmptyEighteen[playerid], 51);
PlayerTextDrawFont(playerid, EmptyEighteen[playerid], 1);
PlayerTextDrawSetProportional(playerid, EmptyEighteen[playerid], 1);

EmptyNineteen[playerid] = CreatePlayerTextDraw(playerid, 491.200195, 256.853179, "Empty");
PlayerTextDrawLetterSize(playerid, EmptyNineteen[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, EmptyNineteen[playerid], 1);
PlayerTextDrawColor(playerid, EmptyNineteen[playerid], -1);
PlayerTextDrawSetShadow(playerid, EmptyNineteen[playerid], 0);
PlayerTextDrawSetOutline(playerid, EmptyNineteen[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, EmptyNineteen[playerid], 51);
PlayerTextDrawFont(playerid, EmptyNineteen[playerid], 1);
PlayerTextDrawSetProportional(playerid, EmptyNineteen[playerid], 1);

EmptyTwenty[playerid] = CreatePlayerTextDraw(playerid, 492.799896, 264.319946, "Empty");
PlayerTextDrawLetterSize(playerid, EmptyTwenty[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, EmptyTwenty[playerid], 1);
PlayerTextDrawColor(playerid, EmptyTwenty[playerid], -1);
PlayerTextDrawSetShadow(playerid, EmptyTwenty[playerid], 0);
PlayerTextDrawSetOutline(playerid, EmptyTwenty[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, EmptyTwenty[playerid], 51);
PlayerTextDrawFont(playerid, EmptyTwenty[playerid], 1);
PlayerTextDrawSetProportional(playerid, EmptyTwenty[playerid], 1);

