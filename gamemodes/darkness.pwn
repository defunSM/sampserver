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

new
	Float: PosX[ MAX_PLAYERS ],
	Float: PosY[ MAX_PLAYERS ],
	Float: PosZ[ MAX_PLAYERS ],
	Float: Angle[ MAX_PLAYERS ],
	Interior[MAX_PLAYERS],
	VirtualWorld[ MAX_PLAYERS ],
	Cash[ MAX_PLAYERS ]
;

forward @load_user_position( playerid, name[], value[] );

@load_user_position( playerid, name[], value[] )
{
    INI_Float( "PositionX", PosX[ playerid ] );
    INI_Float( "PositionY", PosY[ playerid ] );
    INI_Float( "PositionZ", PosZ[ playerid ] );
    INI_Float( "Angle", Angle[ playerid ] );
	INI_Int( "Interior", Interior[ playerid ] );
	INI_Int( "VirtualWorld", VirtualWorld[ playerid ] );
	INI_Int( "Cash", Cash[ playerid ] );
    return ( 1 );
}

stock user_ini_file(playerid)
{
    new
        string[ 128 ],
        user_name[ MAX_PLAYER_NAME ]
    ;

    GetPlayerName( playerid, user_name, MAX_PLAYER_NAME );
    format( string, sizeof ( string ), "%s.ini", user_name );
    /* scriptfiles directory */
    return
        string;
}


enum pBlueprint
{
	Float:pX,
	Float:pY,
	Float:pZ,
};

main()
{
	print("\n----------------------------------");
	print("  Darkness is running.......\n");
	print("----------------------------------\n");
	
}

public OnPlayerConnect(playerid)
{

	new pName[MAX_PLAYER_NAME];
	GetPlayerName(playerid, pName, sizeof(pName));
	if(fexist(str_replace("NAME", pName, "NAME.ini"))) {
	    SendClientMessage( playerid, -1, "[Server] You are registered" );
	    GameTextForPlayer(playerid,"~w~DARKNESS: ~r~ROLEPLAY",5000,5);
	    
	    /*PosX[ playerid ] = 0;
		PosY[ playerid ] = 0;
		PosZ[ playerid ] = 0;
		Angle[ playerid ] = 0;
		Interior[ playerid ] = 0;
		VirtualWorld[ playerid ] = 0;*/

	    INI_ParseFile( user_ini_file( playerid ), "load_user_%s", .bExtra = true, .extra = playerid );
	    
	} else {
	
	    ShowPlayerDialog(playerid, dialog_register_1, DIALOG_STYLE_PASSWORD, "You are not registered", "Please provide a strong password below:", "Continue", "Cancel");

	
		/*RegisterPassword[playerid] = CreatePlayerTextDraw(playerid, 178.399932, 212.053314, "Register");
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
		SelectTextDraw(playerid, 0xFF000088);*/
	}
	return 1;
}

public OnPlayerDisconnect( playerid, reason )
{
    GetPlayerPos( playerid, PosX[ playerid ], PosY[ playerid ], PosZ[ playerid ] );
    GetPlayerFacingAngle( playerid, Angle[ playerid ] );

    new INI:File = INI_Open( user_ini_file( playerid ) );
    INI_SetTag( File, "position" );
    INI_WriteFloat( File, "PositionX", PosX[ playerid ] );
    INI_WriteFloat( File, "PositionY", PosY[ playerid ] );
    INI_WriteFloat( File, "PositionZ", PosZ[ playerid ] );
    INI_WriteFloat( File, "Angle", Angle[ playerid ] );
	INI_WriteInt( File, "Interior", GetPlayerInterior( playerid ) );
	INI_WriteInt( File, "VirtualWorld", GetPlayerVirtualWorld( playerid ) );
	INI_WriteInt( File, "Cash", GetPlayerMoney( playerid ) );
    INI_Close( File );
    return ( 1 );
}

public OnPlayerSpawn(playerid)
{
	SetPlayerInterior(playerid,0);
	TogglePlayerClock(playerid,0);
	
	SetPlayerPos( playerid, PosX[ playerid ], PosY[ playerid ], PosZ[ playerid ] );
	SetPlayerFacingAngle( playerid, Angle[ playerid ] );
	SetPlayerInterior( playerid, Interior[ playerid ] );
	SetPlayerVirtualWorld( playerid, VirtualWorld[ playerid ] );
	GivePlayerMoney( playerid, Cash[ playerid ] );

	
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{

    GetPlayerPos( playerid, PosX[ playerid ], PosY[ playerid ], PosZ[ playerid ] );
    GetPlayerFacingAngle( playerid, Angle[ playerid ] );

    new INI:File = INI_Open( user_ini_file( playerid ) );
    INI_SetTag( File, "position" );
    INI_WriteFloat( File, "PositionX", PosX[ playerid ] );
    INI_WriteFloat( File, "PositionY", PosY[ playerid ] );
    INI_WriteFloat( File, "PositionZ", PosZ[ playerid ] );
    INI_WriteFloat( File, "Angle", Angle[ playerid ] );
	INI_WriteInt( File, "Interior", GetPlayerInterior( playerid ) );
	INI_WriteInt( File, "VirtualWorld", GetPlayerVirtualWorld( playerid ) );
    INI_Close( File );

   	return 1;
}

/*SetupPlayerForClassSelection(playerid)
{
 	SetPlayerInterior(playerid,14);
 	SetPlayerSkin(playerid, 2);
	SetPlayerPos(playerid,258.4893,-41.4008,1002.0234);
	SetPlayerFacingAngle(playerid, 270.0);
	SetPlayerCameraPos(playerid,256.0815,-43.0475,1004.0234);
	SetPlayerCameraLookAt(playerid,258.4893,-41.4008,1002.0234);

	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	SetupPlayerForClassSelection(playerid);
	return 1;
}*/

public OnGameModeInit()
{
	SetGameModeText("Darkness Roleplay Script");
	ShowPlayerMarkers(1);
	ShowNameTags(1);
	AllowAdminTeleport(1);

    

	/*RegisterBackground = TextDrawCreate(449.200012, 162.779998, "usebox");
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
	TextDrawTextSize(RegisterContinue, 300, 20);*/

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
	if(dialogid == dialog_register_1) {
		if(response) {
			if(strlen(inputtext) > 6 && strlen(inputtext) < 16)
				{
					if(IsAlphaNumeric(inputtext)) {
					    new pName[MAX_PLAYER_NAME], registerBuffer[129];
					    GetPlayerName(playerid, pName, sizeof(pName));
					    WP_Hash(registerBuffer, sizeof(registerBuffer), inputtext);
					    new INI:playerRegisterINI = INI_Open(str_replace("NAME", pName, "NAME.ini"));
						INI_SetTag(playerRegisterINI, "Stats");
						INI_WriteString(playerRegisterINI, "Password", registerBuffer);
						INI_Close(playerRegisterINI);
					    /*PlayerTextDrawSetString(playerid, RegisterPassword[playerid], str_repeat("*"), strlen(inputtext));
					    PlayerTextDrawHide(playerid, RegisterPassword[playerid]);
					    PlayerTextDrawShow(playerid, RegisterPassword[playerid]);*/
					    
					    TogglePlayerSpectating(playerid, 0);
					    
					    TextDrawDestroy(Text:RegisterWelcome);
					    TextDrawDestroy(Text:RegisterBackground);
					    PlayerTextDrawHide(playerid, PlayerText:RegisterPassword[playerid]);
					}
					else {
                        ShowPlayerDialog(playerid, dialog_register_1, DIALOG_STYLE_PASSWORD, "ERROR", "Your password must be alphanumeric", "Continue", "Cancel");
					}
				}
			else
			{
				ShowPlayerDialog(playerid, dialog_register_1, DIALOG_STYLE_PASSWORD, "ERROR", "Please enter at least 6 characters", "Continue", "Cancel");
			}
		} else {
		    SendClientMessage(playerid, -1, "You have to login to continue.");
		    Kick(playerid);
		}
	}
	return 1;
}




IsAlphaNumeric(string[]) {
	for(new x=0; x < strlen(string); x++){
	    if((string[x] > 47 && string[x] < 58) || (string[x] > 64 && string[x] < 91) || (string[x] > 96 && string[x] < 123)) {
	        continue;
	    }
	    else
	    {
	        return 0;
	    }
	    
	}
	return 1;
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

CMD:setweapon(playerid, params[]) {
	new TargetID, WeaponID, AmmoAmount;
	if(sscanf(params, "ui", TargetID, WeaponID, AmmoAmount)) return SendClientMessage(playerid, COLOR_GREEN, "Usage: /setweapon [target id] [weapon id] [Ammo]");
	if(!IsPlayerConnected(playerid)) return SendClientMessage(playerid, COLOR_GREEN, "That user is not currently online.");
	if(WeaponID < 0 || WeaponID > 47) return SendClientMessage(playerid, COLOR_GREEN,"That weapon id is invalid.");
	GivePlayerWeapon(TargetID, WeaponID, AmmoAmount);

	SendClientMessage(TargetID, COLOR_GREEN, "Your weapon was changed.");
	SendClientMessage(playerid, COLOR_GREEN, "You have changed the player's weapon.");

	return 1;
}

CMD:setveh(playerid, params[]) {
	new TargetID, VehicleID;
	if(sscanf(params, "ui", TargetID, VehicleID)) return SendClientMessage(playerid, COLOR_GREEN, "Usage: /setveh [target id] [vehicle id]");
	if(!IsPlayerConnected(TargetID)) return SendClientMessage(playerid, COLOR_GREEN, "[ERROR]That user is not currently online.");
	if(VehicleID < 399 || VehicleID > 612) return SendClientMessage(playerid, COLOR_GREEN,"[ERROR]That vehicle id is invalid.");
	new Float:x, Float:y, Float:z;
	GetPlayerPos(TargetID, x, y, z);
	AddStaticVehicle(VehicleID, x-3, y-3, z, 331.3780, 11, 11);

	SendClientMessage(TargetID, COLOR_GREEN, "Your vehicle was changed.");
	SendClientMessage(playerid, COLOR_GREEN, "[SUCCESS]You have spawned a vehicle.");

	return 1;
}

CMD:coord(playerid, params[]) {
	new TargetID;
	if(sscanf(params, "ui", TargetID)) return SendClientMessage(playerid, COLOR_GREEN, "Usage: /coord [target id]");
	if(!IsPlayerConnected(TargetID)) return SendClientMessage(playerid, COLOR_GREEN, "That user is not currently online.");
	new Float:x, Float:y, Float:z;
	GetPlayerPos(TargetID, x, y, z);
	new string[128];
	format(string, sizeof(string), "X: %f Y: %f Z: %f", x, y, z);
	SendClientMessage(playerid, COLOR_GREEN, string);


	return 1;
}

CMD:tp(playerid, params[]) {
	new TargetID, TargetToID;
	if(sscanf(params, "ui", TargetID, TargetToID)) return SendClientMessage(playerid, COLOR_GREEN, "Usage: /tp [target id] [travel id]");
	if(!IsPlayerConnected(TargetID)) return SendClientMessage(TargetID, COLOR_GREEN, "That user is not currently online.");
    if(!IsPlayerConnected(TargetToID)) return SendClientMessage(TargetID, COLOR_GREEN, "That travel user is not currently online.");
	new Float:x, Float:y, Float:z;
	GetPlayerPos(TargetToID, x, y, z);
	SetPlayerPos(TargetID, x, y, z);


	return 1;
}

CMD:coordtp(playerid, params[]) {
	new TargetID, x, y, z;
	if(sscanf(params, "ui", TargetID, x, y, z)) return SendClientMessage(playerid, COLOR_GREEN, "Usage: /coordteleport [target id] [x] [y] [z]");
	if(!IsPlayerConnected(TargetID)) return SendClientMessage(TargetID, COLOR_GREEN, "That user is not currently online.");
	SetPlayerPos(TargetID, Float:x, Float:y, Float:z);
	return 1;
}

CMD:sethealth(playerid, params[]) {
	new TargetID, health;
	if(sscanf(params, "ui", TargetID)) return SendClientMessage(playerid, COLOR_GREEN, "Usage: /sethealth [target id] [health]");
	if(!IsPlayerConnected(TargetID)) return SendClientMessage(TargetID, COLOR_GREEN, "That user is not currently online.");
	SetPlayerHealth(TargetID, health);
	
	return 1;
}

CMD:setarmour(playerid, params[]) {
	new TargetID, armour;
	if(sscanf(params, "ui", TargetID)) return SendClientMessage(playerid, COLOR_GREEN, "Usage: /setarmour [target id] [armour]");
	if(!IsPlayerConnected(TargetID)) return SendClientMessage(TargetID, COLOR_GREEN, "That user is not currently online.");
	SetPlayerArmour(TargetID, armour);

	return 1;
}

CMD:help(playerid, params[]) {
	new Command;
	if(sscanf(params, "ui", Command)) return SendClientMessage(playerid, COLOR_GREEN, "Usage: /help [command name]");
	

	return 1;
}

CMD:adminhelp(playerid, params[]) {
	new Command;
	if(sscanf(params, "ui", Command)) return SendClientMessage(playerid, COLOR_GREEN, "/setcash, /checkcash, /tp, /coordtp, /setveh, /coord, /setskin, /setweapon");
	SendClientMessage(playerid, COLOR_GREEN, "/setcash, /checkcash, /tp, /coordtp, /setveh, /coord, /setskin, /setweapon");

	return 1;
}

CMD:setcash(playerid, params[]) {
	new TargetID, cash;
	if(sscanf(params, "ui", TargetID, cash)) return SendClientMessage(playerid, COLOR_GREEN, "Usage: /setcash [target id] [cash]");
	if(!IsPlayerConnected(TargetID)) return SendClientMessage(TargetID, COLOR_GREEN, "That user is not currently online.");
	ResetPlayerMoney(TargetID);
	GivePlayerMoney(TargetID, cash);

	return 1;
}

CMD:checkcash(playerid, params[]) {
	new TargetID;
	if(sscanf(params, "ui", TargetID)) return SendClientMessage(playerid, COLOR_GREEN, "Usage: /checkcash [target id]");
	if(!IsPlayerConnected(TargetID)) return SendClientMessage(TargetID, COLOR_GREEN, "That user is not currently online.");
	new cashvalue = GetPlayerMoney(TargetID);
	new string[129];
	format(string, sizeof(string), "Player has %d", cashvalue);
	SendClientMessage(playerid, COLOR_GREEN, string);

	return 1;
}










