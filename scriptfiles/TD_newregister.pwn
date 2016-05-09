//Global Textdraws:

new Text:RegisterBackground;
new Text:RegisterWelcome;
new Text:RegisterUnderscore;
new Text:RegisterBox;
new Text:RegisterContinue;


RegisterBackground = TextDrawCreate(449.200012, 162.779998, "usebox");
TextDrawLetterSize(RegisterBackground, 0.000000, 17.437406);
TextDrawTextSize(RegisterBackground, 166.000000, 0.000000);
TextDrawAlignment(RegisterBackground, 1);
TextDrawColor(RegisterBackground, 0);
TextDrawUseBox(RegisterBackground, true);
TextDrawBoxColor(RegisterBackground, 102);
TextDrawSetShadow(RegisterBackground, 0);
TextDrawSetOutline(RegisterBackground, 0);
TextDrawFont(RegisterBackground, 0);

RegisterWelcome = TextDrawCreate(179.199935, 165.760009, "Welcome to Darkness Roleplay");
TextDrawLetterSize(RegisterWelcome, 0.449999, 1.600000);
TextDrawAlignment(RegisterWelcome, 1);
TextDrawColor(RegisterWelcome, -2147483393);
TextDrawSetShadow(RegisterWelcome, 0);
TextDrawSetOutline(RegisterWelcome, 1);
TextDrawBackgroundColor(RegisterWelcome, 51);
TextDrawFont(RegisterWelcome, 1);
TextDrawSetProportional(RegisterWelcome, 1);

RegisterUnderscore = TextDrawCreate(229.599945, 181.440032, "Register below");
TextDrawLetterSize(RegisterUnderscore, 0.449999, 1.600000);
TextDrawAlignment(RegisterUnderscore, 1);
TextDrawColor(RegisterUnderscore, -5963521);
TextDrawSetShadow(RegisterUnderscore, 0);
TextDrawSetOutline(RegisterUnderscore, 1);
TextDrawBackgroundColor(RegisterUnderscore, 51);
TextDrawFont(RegisterUnderscore, 1);
TextDrawSetProportional(RegisterUnderscore, 1);

RegisterBox = TextDrawCreate(274.000000, 213.553329, "usebox");
TextDrawLetterSize(RegisterBox, 0.000000, 1.425556);
TextDrawTextSize(RegisterBox, 172.400009, 0.000000);
TextDrawAlignment(RegisterBox, 1);
TextDrawColor(RegisterBox, 0);
TextDrawUseBox(RegisterBox, true);
TextDrawBoxColor(RegisterBox, 102);
TextDrawSetShadow(RegisterBox, 0);
TextDrawSetOutline(RegisterBox, 0);
TextDrawFont(RegisterBox, 0);

RegisterContinue = TextDrawCreate(370.400054, 306.133239, "Continue");
TextDrawLetterSize(RegisterContinue, 0.449999, 1.600000);
TextDrawAlignment(RegisterContinue, 1);
TextDrawColor(RegisterContinue, -1);
TextDrawSetShadow(RegisterContinue, 0);
TextDrawSetOutline(RegisterContinue, 1);
TextDrawBackgroundColor(RegisterContinue, 51);
TextDrawFont(RegisterContinue, 1);
TextDrawSetProportional(RegisterContinue, 1);
TextDrawSetSelectable(RegisterContinue, true);


//Player Textdraws:

new PlayerText:RegisterPassword[MAX_PLAYERS];


RegisterPassword[playerid] = CreatePlayerTextDraw(playerid, 178.399932, 212.053314, "Password");
PlayerTextDrawLetterSize(playerid, RegisterPassword[playerid], 0.449999, 1.600000);
PlayerTextDrawAlignment(playerid, RegisterPassword[playerid], 1);
PlayerTextDrawColor(playerid, RegisterPassword[playerid], -1);
PlayerTextDrawSetShadow(playerid, RegisterPassword[playerid], 0);
PlayerTextDrawSetOutline(playerid, RegisterPassword[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, RegisterPassword[playerid], 51);
PlayerTextDrawFont(playerid, RegisterPassword[playerid], 1);
PlayerTextDrawSetProportional(playerid, RegisterPassword[playerid], 1);
PlayerTextDrawSetSelectable(playerid, RegisterPassword[playerid], true);

