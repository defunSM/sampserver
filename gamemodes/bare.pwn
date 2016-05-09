#include <a_samp> // includes native functions
#include <core>
#include <float>
#include <strlib> // makes it possible to manipulate strings
#include <YSI\y_commands>
#include <YSI\y_ini>
#include <sscanf2>

#pragma tabsize 0

#define COLOR_GREEN 0x00FF0088
#define COLOR_RED 0xFF000088
#define dialog_register_1 1

native WP_Hash(buffer[], len, const str[]);

new Text:RegisterBackground;
new Text:RegisterWelcome;
new Text:RegisterUnderscore;
new Text:RegisterBox;
new Text:RegisterContinue;
new PlayerText:RegisterPassword[MAX_PLAYERS];


enum pBlueprint {
	Float:pX,
	Float:pY,
	Float:pZ,
};

new gPlayerInfo[MAX_PLAYERS][pBlueprint];

main()
{
	print("\n----------------------------------");
	print("  Darkness is running.......\n");
	print("----------------------------------\n");
	new TestString[12] = "123A5678910";
	for(new x; x < strlen(TestString); x++) {
	    if(TestString[x] == 65) {
			printf("Is A: %c", TestString[x]);
			
		} else {
		    printf("%c", TestString[x]);
		}
	}
}

public OnPlayerConnect(playerid)
{

	GameTextForPlayer(playerid,"~w~DARKNESS: ~r~ROLEPLAY",5000,5);
	gPlayerInfo[playerid][pX] = 5.0;
	
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
	PlayerTextDrawTextSize(playerid, RegisterPassword[playerid], 300, 20);
	
	TextDrawShowForPlayer(playerid, RegisterBackground);
	TextDrawShowForPlayer(playerid, RegisterWelcome);
	TextDrawShowForPlayer(playerid, RegisterUnderscore);
	TextDrawShowForPlayer(playerid, RegisterBox);
	TextDrawShowForPlayer(playerid, RegisterContinue);
	PlayerTextDrawShow(playerid, RegisterPassword[playerid]);
	TogglePlayerSpectating(playerid, 1);
	SelectTextDraw(playerid, 0xFF000088);
	
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	return 1;
}

public OnPlayerSpawn(playerid)
{
	SetPlayerInterior(playerid,0);
	TogglePlayerClock(playerid,0);
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
   	return 1;
}

SetupPlayerForClassSelection(playerid)
{
 	SetPlayerInterior(playerid,14);
 	SetPlayerSkin(playerid, 2);
	SetPlayerPos(playerid,258.4893,-41.4008,1002.0234);
	SetPlayerFacingAngle(playerid, 270.0);
	SetPlayerCameraPos(playerid,256.0815,-43.0475,1004.0234);
	SetPlayerCameraLookAt(playerid,258.4893,-41.4008,1002.0234);
}

public OnPlayerRequestClass(playerid, classid)
{
	SetupPlayerForClassSelection(playerid);
	return 1;
}

public OnGameModeInit()
{
	SetGameModeText("Darkness Roleplay Script");
	ShowPlayerMarkers(1);
	ShowNameTags(1);
	AllowAdminTeleport(1);

	AddPlayerClass(2,1958.3783,1343.1572,15.3746,270.1425,0,0,0,0,-1,-1);
	
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
	TextDrawTextSize(RegisterContinue, 300, 20);

	return 1;
}

public OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid) {
	if(playertextid == RegisterPassword[playerid]) {
	ShowPlayerDialog(playerid, dialog_register_1, DIALOG_STYLE_PASSWORD, "Please Enter a password", "Please provide a strong password below:", "Continue", "Cancel");
	}
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == dialog_register_1 {
		if(response) {
			if(strlen(inputtext) > 6) {

			}
		} else {
		    SendClientMessage(playerid, COLOR_GREEN, "You have to login to continue.");
		    Kick(playerid);
		}
	}
	return 1;
}

strtok(const string[], &index)
{
	new length = strlen(string);
	while ((index < length) && (string[index] <= ' '))
	{
		index++;
	}

	new offset = index;
	new result[20];
	while ((index < length) && (string[index] > ' ') && ((index - offset) < (sizeof(result) - 1)))
	{
		result[index - offset] = string[index];
		index++;
	}
	result[index - offset] = EOS;
	return result;
}

CMD:setskin(playerid, params[]) {
	new TargetID, SkinID;
	if(sscanf(params, "ui", TargetID, SkinID)) return SendClientMessage(playerid, COLOR_GREEN, "Usage: /setskin [target id] [skin id]");
	if(!IsPlayerConnected(playerid)) return SendClientMessage(playerid, COLOR_GREEN, "That user is not currently online.");
	if(SkinID < 0 || SkinID > 299) return SendClientMessage(playerid, COLOR_GREEN,"That skinid is invalid.");
	SetPlayerSkin(TargetID, SkinID);
	
	SendClientMessage(TargetID, COLOR_GREEN, "Your skin was changed.");
	SendClientMessage(playerid, COLOR_GREEN, "You have changed the player's skin id.");
	
	return 1;
}
