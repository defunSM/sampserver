#include <a_samp>
#include <core>
#include <float>
#include <strlib>
#include <YSI\y_commands>
#include <YSI\y_ini>
#include <sscanf2>

#define COLOR_MAROON 0x66000055
#define COLOR_INDIGO 0x6666ff55
#define COLOR_WHITE      0xFFFFFFC8
#define COLOR_YELLOW    0xFFFF00C8
#define COLOR_GREEN      0x00FF00C8
#define COLOR_BLUE        0x0080C0C8
#define COLOR_PURPLE    0x8000FFC8
#define COLOR_PINK        0xFF0080C8
#define COLOR_ORANGE   0xFF8000C8
#define COLOR_GRAY       0x808080C8
#define COLOR_BLACK      0x000000C8

#define PATH "\\Users\\salman\\Desktop\\sampserver\\scriptfiles\\%s.ini"

#define PRESSED(%0) \
	(((newkeys & (%0)) == (%0)) && ((oldkeys & (%0)) != (%0)))

/*--------------------------GLOBAL VARIABLES---------------------------*/

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





new PlayerText:iTDBottomMenu[MAX_PLAYERS];
new newplayer;
new vampire[MAX_PLAYERS];

native WP_Hash(buffer[], len, const str[]);

enum pInfo
{
	pX,
	pY,
	pZ,
	Angle,
	Interior,
	VirtualWorld,
	Cash,
	Skin
}

new PlayerInfo[MAX_PLAYERS][pInfo];

forward LoadUser_data(playerid, name[], value[]);

public LoadUser_data(playerid, name[], value[])
{
    INI_Float("positionX", PlayerInfo[playerid][pX]);
    INI_Float("positionY", PlayerInfo[playerid][pY]);
    INI_Float("positionZ", PlayerInfo[playerid][pZ]);
    INI_Float("Angle", PlayerInfo[playerid][Angle]);
    INI_Int("Interior", PlayerInfo[playerid][Interior]);
    INI_Int("VirtualWorld", PlayerInfo[playerid][VirtualWorld]);
    INI_Int("Cash", PlayerInfo[playerid][Cash]);
    INI_Int("Skin", PlayerInfo[playerid][Skin]);
    printf("Loading Data");
    return 1;
}

stock UserPath(playerid)
{
	new string[128], playername[MAX_PLAYER_NAME];
	GetPlayerName(playerid, playername, sizeof(playername));
	format(string, sizeof(string),"%s.ini", playername);
	printf("Pathing");
    return string;
}


/*
new
	Float: PosX[ MAX_PLAYERS ],
	Float: PosY[ MAX_PLAYERS ],
	Float: PosZ[ MAX_PLAYERS ],
	Float: Angle[ MAX_PLAYERS ],
	Interior[MAX_PLAYERS],
	VirtualWorld[ MAX_PLAYERS ],
 	Cash[ MAX_PLAYERS ],
	Skin[ MAX_PLAYERS ]
;

forward @load_user_position( playerid, name[], value[]);

@load_user_position( playerid , name[], value[])
{
    new INI:File = INI_Open( user_ini_file( playerid ) );
    INI_Float( "PositionX", PosX[ playerid ] );
    INI_Float( "PositionY", PosY[ playerid ] );
    INI_Float( "PositionZ", PosZ[ playerid ] );
    INI_Float( "Angle", Angle[ playerid ] );
	INI_Int( "Interior", Interior[ playerid ] );
	INI_Int( "VirtualWorld", VirtualWorld[ playerid ] );
	INI_Int( "Cash", Cash[ playerid ] );
	INI_Int( "Skin", Skin[ playerid ] );
	printf("Data loaded");
    return ( 1 );
}

*/
/*--------------------------------------------TEST--------------------------------------*/






/*--------------------------------------------------------------------------------------*/


/*
stock user_ini_file(playerid)
{
    new
        string[ 128 ],
        user_name[ MAX_PLAYER_NAME ]
    ;

    GetPlayerName( playerid, user_name, MAX_PLAYER_NAME );
    format( string, sizeof ( string ), "%s.ini", user_name );
     scriptfiles directory
    
    printf(string);
    return string;
}
*/



/*---------------------------CALL BACKS--------------------------------*/

main()
{
	print("\n----------------------------------");
	print(" Darkness Gamemode by Salman Hossain");
	print("----------------------------------\n");
}



public OnGameModeInit()
{
	// Don't use these lines if it's a filterscript
	SetGameModeText("Darkness Roleplay Script");
	AddPlayerClass(0, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0);
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
 	SetPlayerPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraLookAt(playerid, 1958.3783, 1343.1572, 15.3746);
	return 1;
}



public OnPlayerConnect(playerid)
{
    new pName[MAX_PLAYER_NAME];
	GetPlayerName(playerid, pName, sizeof(pName));
    if(fexist(UserPath(playerid)))
	{
	    SendClientMessage( playerid, -1, "[Server] You are registered" );
	    GameTextForPlayer(playerid,"~w~DARKNESS: ~r~ROLEPLAY",5000,5);
	    INI_ParseFile( UserPath( playerid ), "LoadUser_%s", .bExtra = true, .extra = playerid);
	    newplayer = false;
	    loadplayersettings(playerid);

    }
    else
    {
        ShowPlayerDialog(playerid, 60, DIALOG_STYLE_PASSWORD, "You are not registered", "Please provide a strong password below:", "Continue", "Cancel");
		newplayer = true;
		AddPlayerClass(2, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0);
    }
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{

    GetPlayerPos( playerid, PlayerInfo[ playerid ][pX], PlayerInfo[ playerid ][pY], PlayerInfo[ playerid ][pZ] );
    GetPlayerFacingAngle( playerid, PlayerInfo[ playerid ][Angle] );
    PlayerInfo[playerid][Cash] = GetPlayerMoney(playerid);
    PlayerInfo[playerid][Skin] = GetPlayerSkin(playerid);

    new INI:File = INI_Open(UserPath( playerid ) );
    INI_SetTag( File, "position" );
    INI_WriteFloat( File, "positionX", PlayerInfo[ playerid ][pX] );
    INI_WriteFloat( File, "positionY", PlayerInfo[ playerid ][pY] );
    INI_WriteFloat( File, "positionZ", PlayerInfo[ playerid ][pZ] );
    INI_WriteFloat( File, "Angle", PlayerInfo[ playerid ][Angle] );
	INI_WriteInt( File, "Interior", GetPlayerInterior( playerid ) );
	INI_WriteInt( File, "VirtualWorld", GetPlayerVirtualWorld( playerid ) );
	INI_WriteInt( File, "Cash", GetPlayerMoney( playerid ) );
	INI_WriteInt( File, "Skin", GetPlayerSkin(playerid) );
    INI_Close( File );

	return 1;
}

public OnPlayerSpawn(playerid)
{
    DisplayBottomMenu(playerid);
    SetPlayerInterior(playerid,0);
	TogglePlayerClock(playerid,0);
	displaycharacteritems(playerid);
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	return 1;
}

public OnVehicleSpawn(vehicleid)
{
	return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
	return 1;
}

public OnPlayerText(playerid, text[])
{
	return 1;
}



public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveRaceCheckpoint(playerid)
{
	return 1;
}

public OnRconCommand(cmd[])
{
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	return 1;
}

public OnObjectMoved(objectid)
{
	return 1;
}

public OnPlayerObjectMoved(playerid, objectid)
{
	return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
	return 1;
}

public OnVehicleMod(playerid, vehicleid, componentid)
{
	return 1;
}

public OnVehiclePaintjob(playerid, vehicleid, paintjobid)
{
	return 1;
}

public OnVehicleRespray(playerid, vehicleid, color1, color2)
{
	return 1;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	return 1;
}

public OnPlayerExitedMenu(playerid)
{
	return 1;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(PRESSED(KEY_JUMP) & vampire[playerid] == true)
	{
	    new Float:SuperJump[3];
		GetPlayerVelocity(playerid, SuperJump[0], SuperJump[1], SuperJump[2]);
		SetPlayerVelocity(playerid, SuperJump[0], SuperJump[1], SuperJump[2]+5);
 	}

	return 1;
}

public OnRconLoginAttempt(ip[], password[], success)
{
	return 1;
}

public OnPlayerUpdate(playerid)
{
	return 1;
}

public OnPlayerStreamIn(playerid, forplayerid)
{
	return 1;
}

public OnPlayerStreamOut(playerid, forplayerid)
{
	return 1;
}

public OnVehicleStreamIn(vehicleid, forplayerid)
{
	return 1;
}

public OnVehicleStreamOut(vehicleid, forplayerid)
{
	return 1;
}


public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	return 1;
}

/*----------------------------------CMD--------------------------------------*/

CMD:setskin(playerid, params[]) {
	new TargetID, SkinID;
	if(sscanf(params, "ui", TargetID, SkinID)) return SendClientMessage(playerid, COLOR_INDIGO, "Usage: /setskin [target id] [skin id]");
	if(!IsPlayerConnected(playerid)) return SendClientMessage(playerid, COLOR_INDIGO, "That user is not currently online.");
	if(SkinID < 0 || SkinID > 299) return SendClientMessage(playerid, COLOR_INDIGO,"That skinid is invalid.");
	SetPlayerSkin(TargetID, SkinID);

	SendClientMessage(TargetID, COLOR_INDIGO, "Your skin was changed.");
	SendClientMessage(playerid, COLOR_INDIGO, "You have changed the player's skin id.");

	return 1;
}

CMD:setweapon(playerid, params[]) {
	new TargetID, WeaponID, AmmoAmount;
	if(sscanf(params, "ui", TargetID, WeaponID, AmmoAmount)) return SendClientMessage(playerid, COLOR_INDIGO, "Usage: /setweapon [target id] [weapon id] [Ammo]");
	if(!IsPlayerConnected(playerid)) return SendClientMessage(playerid, COLOR_INDIGO, "That user is not currently online.");
	if(WeaponID < 0 || WeaponID > 47) return SendClientMessage(playerid, COLOR_INDIGO,"That weapon id is invalid.");
	GivePlayerWeapon(TargetID, WeaponID, AmmoAmount);

	SendClientMessage(TargetID, COLOR_INDIGO, "Your weapon was changed.");
	SendClientMessage(playerid, COLOR_INDIGO, "You have changed the player's weapon.");

	return 1;
}

CMD:setveh(playerid, params[]) {
	new TargetID, VehicleID;
	if(sscanf(params, "ui", TargetID, VehicleID)) return SendClientMessage(playerid, COLOR_INDIGO, "Usage: /setveh [target id] [vehicle id]");
	if(!IsPlayerConnected(TargetID)) return SendClientMessage(playerid, COLOR_INDIGO, "[ERROR]That user is not currently online.");
	if(VehicleID < 399 || VehicleID > 612) return SendClientMessage(playerid, COLOR_INDIGO,"[ERROR]That vehicle id is invalid.");
	new Float:x, Float:y, Float:z;
	GetPlayerPos(TargetID, x, y, z);
	AddStaticVehicle(VehicleID, x-3, y-3, z, 331.3780, 11, 11);

	SendClientMessage(TargetID, COLOR_INDIGO, "Your vehicle was changed.");
	SendClientMessage(playerid, COLOR_INDIGO, "[SUCCESS]You have spawned a vehicle.");

	return 1;
}

CMD:coord(playerid, params[]) {
	new TargetID;
	if(sscanf(params, "ui", TargetID)) return SendClientMessage(playerid, COLOR_INDIGO, "Usage: /coord [target id]");
	if(!IsPlayerConnected(TargetID)) return SendClientMessage(playerid, COLOR_INDIGO, "That user is not currently online.");
	new Float:x, Float:y, Float:z;
	GetPlayerPos(TargetID, x, y, z);
	new string[128];
	format(string, sizeof(string), "X: %f Y: %f Z: %f", x, y, z);
	SendClientMessage(playerid, COLOR_INDIGO, string);


	return 1;
}

CMD:tp(playerid, params[]) {
	new TargetID, TargetToID;
	if(sscanf(params, "ui", TargetID, TargetToID)) return SendClientMessage(playerid, COLOR_INDIGO, "Usage: /tp [target id] [travel id]");
	if(!IsPlayerConnected(TargetID)) return SendClientMessage(TargetID, COLOR_INDIGO, "That user is not currently online.");
    if(!IsPlayerConnected(TargetToID)) return SendClientMessage(TargetID, COLOR_INDIGO, "That travel user is not currently online.");
	new Float:x, Float:y, Float:z;
	GetPlayerPos(TargetToID, x, y, z);
	SetPlayerPos(TargetID, x, y, z);


	return 1;
}

CMD:coordtp(playerid, params[]) {
	new TargetID, x, y, z;
	if(sscanf(params, "ui", TargetID, x, y, z)) return SendClientMessage(playerid, COLOR_INDIGO, "Usage: /coordteleport [target id] [x] [y] [z]");
	if(!IsPlayerConnected(TargetID)) return SendClientMessage(TargetID, COLOR_INDIGO, "That user is not currently online.");
	SetPlayerPos(TargetID, Float:x, Float:y, Float:z);
	return 1;
}

CMD:sethealth(playerid, params[]) {
	new TargetID, health;
	if(sscanf(params, "ui", TargetID)) return SendClientMessage(playerid, COLOR_INDIGO, "Usage: /sethealth [target id] [health]");
	if(!IsPlayerConnected(TargetID)) return SendClientMessage(TargetID, COLOR_INDIGO, "That user is not currently online.");
	SetPlayerHealth(TargetID, health);

	return 1;
}

CMD:setarmour(playerid, params[]) {
	new TargetID, armour;
	if(sscanf(params, "ui", TargetID)) return SendClientMessage(playerid, COLOR_INDIGO, "Usage: /setarmour [target id] [armour]");
	if(!IsPlayerConnected(TargetID)) return SendClientMessage(TargetID, COLOR_INDIGO, "That user is not currently online.");
	SetPlayerArmour(TargetID, armour);

	return 1;
}

CMD:help(playerid, params[]) {
	new Command;
	if(sscanf(params, "ui", Command)) return SendClientMessage(playerid, COLOR_INDIGO, "Usage: /help [command name]");


	return 1;
}

CMD:adminhelp(playerid, params[])
{
	ShowPlayerDialog(playerid, 50, DIALOG_STYLE_LIST, "AdminCMD", "Rules\nCommands\nJobs\nFireArms\nMelee\nRace", "Select", "Cancel");

	return 1;
}

CMD:setcash(playerid, params[]) {
	new TargetID, cash;
	if(sscanf(params, "ui", TargetID, cash)) return SendClientMessage(playerid, COLOR_INDIGO, "Usage: /setcash [target id] [cash]");
	if(!IsPlayerConnected(TargetID)) return SendClientMessage(TargetID, COLOR_INDIGO, "That user is not currently online.");
	ResetPlayerMoney(TargetID);
	GivePlayerMoney(TargetID, cash);

	return 1;
}

CMD:checkcash(playerid, params[]) {
	new TargetID;
	if(sscanf(params, "ui", TargetID)) return SendClientMessage(playerid, COLOR_INDIGO, "Usage: /checkcash [target id]");
	if(!IsPlayerConnected(TargetID)) return SendClientMessage(TargetID, COLOR_INDIGO, "That user is not currently online.");
	new cashvalue = GetPlayerMoney(TargetID);
	new string[129];
	format(string, sizeof(string), "Player has %d", cashvalue);
	SendClientMessage(playerid, COLOR_INDIGO, string);

	return 1;
}

CMD:setvampire(playerid, params[]) {
	new TargetID;
	if(sscanf(params, "ui", TargetID)) return SendClientMessage(playerid, COLOR_INDIGO, "Usage: /setvampire [target id]");
	if(!IsPlayerConnected(TargetID)) return SendClientMessage(TargetID, COLOR_INDIGO, "That user is not currently online.");
	vampire[playerid] = true;

	return 1;
}


/*---------------------------------CUSTOM------------------------------------*/

DisplayBottomMenu(playerid)
{
	iTDBottomMenu[playerid] = CreatePlayerTextDraw(playerid, 641.199951, 421.873321, "usebox");
	PlayerTextDrawLetterSize(playerid, iTDBottomMenu[playerid], 0.000000, 2.670000);
	PlayerTextDrawTextSize(playerid, iTDBottomMenu[playerid], -2.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, iTDBottomMenu[playerid], 1);
	PlayerTextDrawColor(playerid, iTDBottomMenu[playerid], 0);
	PlayerTextDrawUseBox(playerid, iTDBottomMenu[playerid], true);
	PlayerTextDrawBoxColor(playerid, iTDBottomMenu[playerid], 102);
	PlayerTextDrawSetShadow(playerid, iTDBottomMenu[playerid], 0);
	PlayerTextDrawSetOutline(playerid, iTDBottomMenu[playerid], 0);
	PlayerTextDrawFont(playerid, iTDBottomMenu[playerid], 0);
	PlayerTextDrawShow(playerid, PlayerText:iTDBottomMenu[playerid]);

}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == 50 && response == 1)
	{
		switch(listitem)
		{
		case 0: ShowPlayerDialog(playerid, 51, DIALOG_STYLE_MSGBOX, "{00C0FF}Rules", "Tele 1 \nTele 2 \nTele 3", "Ok", "Cancel");
		case 1: ShowPlayerDialog(playerid, 52, DIALOG_STYLE_MSGBOX, "{00C0FF}Commands", "/setveh [TargetID] [Vehicle ID] info:spawns the vehicle to the target id.\n/setcash [TargetID] [Cash Amount] info: sets the cash value for the target id.\n/coord [Target ID] info: Displays the xyz coordinates of the player.\n/tp [TargetID] [Travel ID] info: Teleports Target ID to travel ID.\n/adminhelp info: Allows you to see everything.\n/coordtp [Target ID] [x] [y] [z]", "Ok", "Cancel");
		case 2: ShowPlayerDialog(playerid, 52, DIALOG_STYLE_MSGBOX, "{00C0FF}Rules", "Ru 1 \nRule 2 \nRule 3", "Ok", "Cancel");
		case 3: ShowPlayerDialog(playerid, 53, DIALOG_STYLE_LIST, "{00C0FF}FireArm", "9mm \nSilenced 9mm\nDeagle\nShotgun\nSpawn-Off Shotgun\nSpas-12\nMac-9\nMP5\nAK47\nM4\nTec-9\nRifle\nSniper Rifle\nRPG\nHoming Rocket Launcher\nFlameThrower\nMinigun\nRemote C4\nRemote C4 Controller\nSpray Can\nFire Extinguisher\nCamera\nParachute", "Select", "Cancel");
        case 4: ShowPlayerDialog(playerid, 54, DIALOG_STYLE_LIST, "{00C0FF}Melee", "Brass Knuckles\nGolf Club\nNightStick\nKnife\nBaseball Bat\nShovel\nPool Cue\nKatana\nChainsaw\nPurple Dildo\nDildo\nVibrator\nSilver Vibrator\nFlowers\nCane\nGrenade\nTearGas\nMolotovCockTail", "Ok", "Cancel");
        case 5: ShowPlayerDialog(playerid, 55, DIALOG_STYLE_LIST, "{00C0FF}Race","Vampire", "Select", "Cancel");
		}
	
	}
	if(dialogid == 55 && response == 1){
	    vampire[playerid] = true;
	    SendClientMessage(playerid, COLOR_MAROON, "You are now a vampire.");
	}
	if(dialogid == 54 && response == 1){
	    switch(listitem)
	    {
        case 0: GivePlayerWeapon(playerid, 1, 100);
		case 1: GivePlayerWeapon(playerid, 2, 100);
        case 2: GivePlayerWeapon(playerid, 3, 100);
        case 3: GivePlayerWeapon(playerid, 4, 100);
        case 4: GivePlayerWeapon(playerid, 5, 100);
        case 5: GivePlayerWeapon(playerid, 6, 100);
        case 6: GivePlayerWeapon(playerid, 7, 100);
        case 7: GivePlayerWeapon(playerid, 8, 100);
        case 8: GivePlayerWeapon(playerid, 9, 100);
        case 9: GivePlayerWeapon(playerid, 10, 100);
        case 10: GivePlayerWeapon(playerid, 11, 100);
        case 11: GivePlayerWeapon(playerid, 12, 100);
        case 12: GivePlayerWeapon(playerid, 13, 100);
        case 13: GivePlayerWeapon(playerid, 14, 100);
        case 14: GivePlayerWeapon(playerid, 15, 100);
        case 15: GivePlayerWeapon(playerid, 16, 100);
        case 16: GivePlayerWeapon(playerid, 17, 100);
        case 17: GivePlayerWeapon(playerid, 18, 100);
	    }
	}

	if(dialogid == 53 && response == 1)
	{
	    switch(listitem)
	    {
		case 0: GivePlayerWeapon(playerid, 22, 100);
		case 1: GivePlayerWeapon(playerid, 23, 100);
        case 2: GivePlayerWeapon(playerid, 24, 100);
        case 3: GivePlayerWeapon(playerid, 25, 100);
        case 4: GivePlayerWeapon(playerid, 26, 100);
        case 5: GivePlayerWeapon(playerid, 27, 100);
        case 6: GivePlayerWeapon(playerid, 28, 100);
        case 7: GivePlayerWeapon(playerid, 29, 100);
        case 8: GivePlayerWeapon(playerid, 30, 100);
        case 9: GivePlayerWeapon(playerid, 31, 100);
        case 10: GivePlayerWeapon(playerid, 32, 100);
        case 11: GivePlayerWeapon(playerid, 33, 100);
        case 12: GivePlayerWeapon(playerid, 34, 100);
        case 13: GivePlayerWeapon(playerid, 35, 100);
        case 14: GivePlayerWeapon(playerid, 36, 100);
        case 15: GivePlayerWeapon(playerid, 37, 100);
        case 16: GivePlayerWeapon(playerid, 38, 100);
        case 17: GivePlayerWeapon(playerid, 39, 100);
        case 18: GivePlayerWeapon(playerid, 40, 100);
        case 19: GivePlayerWeapon(playerid, 41, 100);
        case 20: GivePlayerWeapon(playerid, 42, 100);
        case 21: GivePlayerWeapon(playerid, 43, 100);
        case 22: GivePlayerWeapon(playerid, 46, 1);
		}
	}
	
	if(dialogid == 60)
	{
		if(response) {
			if(strlen(inputtext) > 6 && strlen(inputtext) < 16)
				{
					if(IsAlphaNumeric(inputtext))
					{
					    new pName[MAX_PLAYER_NAME], registerBuffer[129];
					    GetPlayerName(playerid, pName, sizeof(pName));
					    WP_Hash(registerBuffer, sizeof(registerBuffer), inputtext);
					    new INI:playerRegisterINI = INI_Open(str_replace("NAME", pName, "NAME.ini"));
						INI_SetTag(playerRegisterINI, "Stats");
						INI_WriteString(playerRegisterINI, "Password", registerBuffer);
						INI_Close(playerRegisterINI);
					    

					    TogglePlayerSpectating(playerid, 0);
					}
					else
				 	{
                        ShowPlayerDialog(playerid, 60, DIALOG_STYLE_PASSWORD, "ERROR", "Your password must be alphanumeric", "Continue", "Cancel");
					}
				}
			else
			{
				ShowPlayerDialog(playerid, 60, DIALOG_STYLE_PASSWORD, "ERROR", "Please enter at least 6 characters", "Continue", "Cancel");
			}
		} else
		{
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

loadplayersettings(playerid) {
    if(newplayer == false)
	{
		SetPlayerPos( playerid, PlayerInfo[ playerid ][pX], PlayerInfo[ playerid ][pY], PlayerInfo[ playerid ][pZ] + 2 );
		SetPlayerFacingAngle( playerid, PlayerInfo[ playerid ][Angle] );
		SetPlayerInterior( playerid, PlayerInfo[ playerid ][Interior] );
		SetPlayerVirtualWorld( playerid, PlayerInfo[ playerid ][VirtualWorld] );
		ResetPlayerMoney(playerid);
		GivePlayerMoney( playerid, PlayerInfo[ playerid ][Cash]);
		SetPlayerSkin(playerid, PlayerInfo[ playerid][Skin]);
		
		
	}
	return 1;
}

displaycharacteritems(playerid) {

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
PlayerTextDrawShow(playerid, PlayerText:CharacterItemBackGround[playerid]);


CharacterItemLabel[playerid] = CreatePlayerTextDraw(playerid, 508.799926, 111.253349, "Character Items");
PlayerTextDrawLetterSize(playerid, CharacterItemLabel[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, CharacterItemLabel[playerid], 1);
PlayerTextDrawColor(playerid, CharacterItemLabel[playerid], -1);
PlayerTextDrawSetShadow(playerid, CharacterItemLabel[playerid], 0);
PlayerTextDrawSetOutline(playerid, CharacterItemLabel[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, CharacterItemLabel[playerid], 51);
PlayerTextDrawFont(playerid, CharacterItemLabel[playerid], 1);
PlayerTextDrawSetProportional(playerid, CharacterItemLabel[playerid], 1);
PlayerTextDrawShow(playerid, PlayerText:CharacterItemLabel[playerid]);


ItemOne[playerid] = CreatePlayerTextDraw(playerid, 476.800079, 123.199981, "1.");
PlayerTextDrawLetterSize(playerid, ItemOne[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, ItemOne[playerid], 1);
PlayerTextDrawColor(playerid, ItemOne[playerid], -1);
PlayerTextDrawSetShadow(playerid, ItemOne[playerid], 0);
PlayerTextDrawSetOutline(playerid, ItemOne[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, ItemOne[playerid], 51);
PlayerTextDrawFont(playerid, ItemOne[playerid], 1);
PlayerTextDrawSetProportional(playerid, ItemOne[playerid], 1);
PlayerTextDrawShow(playerid, PlayerText:ItemOne[playerid]);


ItemTwo[playerid] = CreatePlayerTextDraw(playerid, 476.800018, 131.413314, "2.");
PlayerTextDrawLetterSize(playerid, ItemTwo[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, ItemTwo[playerid], 1);
PlayerTextDrawColor(playerid, ItemTwo[playerid], -1);
PlayerTextDrawSetShadow(playerid, ItemTwo[playerid], 0);
PlayerTextDrawSetOutline(playerid, ItemTwo[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, ItemTwo[playerid], 51);
PlayerTextDrawFont(playerid, ItemTwo[playerid], 1);
PlayerTextDrawSetProportional(playerid, ItemTwo[playerid], 1);
PlayerTextDrawShow(playerid, PlayerText:ItemTwo[playerid]);

ItemThree[playerid] = CreatePlayerTextDraw(playerid, 477.600036, 138.879974, "3.");
PlayerTextDrawLetterSize(playerid, ItemThree[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, ItemThree[playerid], 1);
PlayerTextDrawColor(playerid, ItemThree[playerid], -1);
PlayerTextDrawSetShadow(playerid, ItemThree[playerid], 0);
PlayerTextDrawSetOutline(playerid, ItemThree[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, ItemThree[playerid], 51);
PlayerTextDrawFont(playerid, ItemThree[playerid], 1);
PlayerTextDrawSetProportional(playerid, ItemThree[playerid], 1);
PlayerTextDrawShow(playerid, PlayerText:ItemThree[playerid]);


ItemFour[playerid] = CreatePlayerTextDraw(playerid, 477.600311, 146.346542, "4.");
PlayerTextDrawLetterSize(playerid, ItemFour[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, ItemFour[playerid], 1);
PlayerTextDrawColor(playerid, ItemFour[playerid], -1);
PlayerTextDrawSetShadow(playerid, ItemFour[playerid], 0);
PlayerTextDrawSetOutline(playerid, ItemFour[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, ItemFour[playerid], 51);
PlayerTextDrawFont(playerid, ItemFour[playerid], 1);
PlayerTextDrawSetProportional(playerid, ItemFour[playerid], 1);
PlayerTextDrawShow(playerid, PlayerText:ItemFour[playerid]);

ItemFive[playerid] = CreatePlayerTextDraw(playerid, 477.600036, 153.813217, "5.");
PlayerTextDrawLetterSize(playerid, ItemFive[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, ItemFive[playerid], 1);
PlayerTextDrawColor(playerid, ItemFive[playerid], -1);
PlayerTextDrawSetShadow(playerid, ItemFive[playerid], 0);
PlayerTextDrawSetOutline(playerid, ItemFive[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, ItemFive[playerid], 51);
PlayerTextDrawFont(playerid, ItemFive[playerid], 1);
PlayerTextDrawSetProportional(playerid, ItemFive[playerid], 1);
PlayerTextDrawShow(playerid, PlayerText:ItemFive[playerid]);

ItemSix[playerid] = CreatePlayerTextDraw(playerid, 478.400054, 161.279953, "6.");
PlayerTextDrawLetterSize(playerid, ItemSix[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, ItemSix[playerid], 1);
PlayerTextDrawColor(playerid, ItemSix[playerid], -1);
PlayerTextDrawSetShadow(playerid, ItemSix[playerid], 0);
PlayerTextDrawSetOutline(playerid, ItemSix[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, ItemSix[playerid], 51);
PlayerTextDrawFont(playerid, ItemSix[playerid], 1);
PlayerTextDrawSetProportional(playerid, ItemSix[playerid], 1);
PlayerTextDrawShow(playerid, PlayerText:ItemSix[playerid]);


ItemSeven[playerid] = CreatePlayerTextDraw(playerid, 478.400085, 168.746673, "7.");
PlayerTextDrawLetterSize(playerid, ItemSeven[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, ItemSeven[playerid], 1);
PlayerTextDrawColor(playerid, ItemSeven[playerid], -1);
PlayerTextDrawSetShadow(playerid, ItemSeven[playerid], 0);
PlayerTextDrawSetOutline(playerid, ItemSeven[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, ItemSeven[playerid], 51);
PlayerTextDrawFont(playerid, ItemSeven[playerid], 1);
PlayerTextDrawSetProportional(playerid, ItemSeven[playerid], 1);
PlayerTextDrawShow(playerid, PlayerText:ItemSeven[playerid]);

ItemEight[playerid] = CreatePlayerTextDraw(playerid, 479.200134, 176.213272, "8.");
PlayerTextDrawLetterSize(playerid, ItemEight[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, ItemEight[playerid], 1);
PlayerTextDrawColor(playerid, ItemEight[playerid], -1);
PlayerTextDrawSetShadow(playerid, ItemEight[playerid], 0);
PlayerTextDrawSetOutline(playerid, ItemEight[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, ItemEight[playerid], 51);
PlayerTextDrawFont(playerid, ItemEight[playerid], 1);
PlayerTextDrawSetProportional(playerid, ItemEight[playerid], 1);
PlayerTextDrawShow(playerid, PlayerText:ItemEight[playerid]);

ItemNine[playerid] = CreatePlayerTextDraw(playerid, 479.200073, 183.679885, "9.");
PlayerTextDrawLetterSize(playerid, ItemNine[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, ItemNine[playerid], 1);
PlayerTextDrawColor(playerid, ItemNine[playerid], -1);
PlayerTextDrawSetShadow(playerid, ItemNine[playerid], 0);
PlayerTextDrawSetOutline(playerid, ItemNine[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, ItemNine[playerid], 51);
PlayerTextDrawFont(playerid, ItemNine[playerid], 1);
PlayerTextDrawSetProportional(playerid, ItemNine[playerid], 1);
PlayerTextDrawShow(playerid, PlayerText:ItemNine[playerid]);

ItemTen[playerid] = CreatePlayerTextDraw(playerid, 474.400054, 191.146575, "10.");
PlayerTextDrawLetterSize(playerid, ItemTen[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, ItemTen[playerid], 1);
PlayerTextDrawColor(playerid, ItemTen[playerid], -1);
PlayerTextDrawSetShadow(playerid, ItemTen[playerid], 0);
PlayerTextDrawSetOutline(playerid, ItemTen[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, ItemTen[playerid], 51);
PlayerTextDrawFont(playerid, ItemTen[playerid], 1);
PlayerTextDrawSetProportional(playerid, ItemTen[playerid], 1);
PlayerTextDrawShow(playerid, PlayerText:ItemTen[playerid]);

ItemEleven[playerid] = CreatePlayerTextDraw(playerid, 475.200103, 198.613296, "11.");
PlayerTextDrawLetterSize(playerid, ItemEleven[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, ItemEleven[playerid], 1);
PlayerTextDrawColor(playerid, ItemEleven[playerid], -1);
PlayerTextDrawSetShadow(playerid, ItemEleven[playerid], 0);
PlayerTextDrawSetOutline(playerid, ItemEleven[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, ItemEleven[playerid], 51);
PlayerTextDrawFont(playerid, ItemEleven[playerid], 1);
PlayerTextDrawSetProportional(playerid, ItemEleven[playerid], 1);
PlayerTextDrawShow(playerid, PlayerText:ItemEleven[playerid]);

ItemTwelve[playerid] = CreatePlayerTextDraw(playerid, 475.200134, 205.333374, "12.");
PlayerTextDrawLetterSize(playerid, ItemTwelve[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, ItemTwelve[playerid], 1);
PlayerTextDrawColor(playerid, ItemTwelve[playerid], -1);
PlayerTextDrawSetShadow(playerid, ItemTwelve[playerid], 0);
PlayerTextDrawSetOutline(playerid, ItemTwelve[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, ItemTwelve[playerid], 51);
PlayerTextDrawFont(playerid, ItemTwelve[playerid], 1);
PlayerTextDrawSetProportional(playerid, ItemTwelve[playerid], 1);
PlayerTextDrawShow(playerid, PlayerText:ItemTwelve[playerid]);

ItemThirteen[playerid] = CreatePlayerTextDraw(playerid, 475.200134, 212.799987, "13.");
PlayerTextDrawLetterSize(playerid, ItemThirteen[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, ItemThirteen[playerid], 1);
PlayerTextDrawColor(playerid, ItemThirteen[playerid], -1);
PlayerTextDrawSetShadow(playerid, ItemThirteen[playerid], 0);
PlayerTextDrawSetOutline(playerid, ItemThirteen[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, ItemThirteen[playerid], 51);
PlayerTextDrawFont(playerid, ItemThirteen[playerid], 1);
PlayerTextDrawSetProportional(playerid, ItemThirteen[playerid], 1);
PlayerTextDrawShow(playerid, PlayerText:ItemThirteen[playerid]);

ItemFourteen[playerid] = CreatePlayerTextDraw(playerid, 475.200073, 220.266677, "14.");
PlayerTextDrawLetterSize(playerid, ItemFourteen[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, ItemFourteen[playerid], 1);
PlayerTextDrawColor(playerid, ItemFourteen[playerid], -1);
PlayerTextDrawSetShadow(playerid, ItemFourteen[playerid], 0);
PlayerTextDrawSetOutline(playerid, ItemFourteen[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, ItemFourteen[playerid], 51);
PlayerTextDrawFont(playerid, ItemFourteen[playerid], 1);
PlayerTextDrawSetProportional(playerid, ItemFourteen[playerid], 1);
PlayerTextDrawShow(playerid, PlayerText:ItemFourteen[playerid]);


ItemFifthteen[playerid] = CreatePlayerTextDraw(playerid, 475.200042, 227.733291, "15.");
PlayerTextDrawLetterSize(playerid, ItemFifthteen[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, ItemFifthteen[playerid], 1);
PlayerTextDrawColor(playerid, ItemFifthteen[playerid], -1);
PlayerTextDrawSetShadow(playerid, ItemFifthteen[playerid], 0);
PlayerTextDrawSetOutline(playerid, ItemFifthteen[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, ItemFifthteen[playerid], 51);
PlayerTextDrawFont(playerid, ItemFifthteen[playerid], 1);
PlayerTextDrawSetProportional(playerid, ItemFifthteen[playerid], 1);
PlayerTextDrawShow(playerid, PlayerText:ItemFifthteen[playerid]);

ItemSixteen[playerid] = CreatePlayerTextDraw(playerid, 476.000061, 235.199996, "16.");
PlayerTextDrawLetterSize(playerid, ItemSixteen[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, ItemSixteen[playerid], 1);
PlayerTextDrawColor(playerid, ItemSixteen[playerid], -1);
PlayerTextDrawSetShadow(playerid, ItemSixteen[playerid], 0);
PlayerTextDrawSetOutline(playerid, ItemSixteen[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, ItemSixteen[playerid], 51);
PlayerTextDrawFont(playerid, ItemSixteen[playerid], 1);
PlayerTextDrawSetProportional(playerid, ItemSixteen[playerid], 1);
PlayerTextDrawShow(playerid, PlayerText:ItemSixteen[playerid]);

ItemSeventeen[playerid] = CreatePlayerTextDraw(playerid, 476.000091, 242.666625, "17.");
PlayerTextDrawLetterSize(playerid, ItemSeventeen[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, ItemSeventeen[playerid], 1);
PlayerTextDrawColor(playerid, ItemSeventeen[playerid], -1);
PlayerTextDrawSetShadow(playerid, ItemSeventeen[playerid], 0);
PlayerTextDrawSetOutline(playerid, ItemSeventeen[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, ItemSeventeen[playerid], 51);
PlayerTextDrawFont(playerid, ItemSeventeen[playerid], 1);
PlayerTextDrawSetProportional(playerid, ItemSeventeen[playerid], 1);
PlayerTextDrawShow(playerid, PlayerText:ItemSeventeen[playerid]);

ItemEighteen[playerid] = CreatePlayerTextDraw(playerid, 476.000000, 249.386611, "18.");
PlayerTextDrawLetterSize(playerid, ItemEighteen[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, ItemEighteen[playerid], 1);
PlayerTextDrawColor(playerid, ItemEighteen[playerid], -1);
PlayerTextDrawSetShadow(playerid, ItemEighteen[playerid], 0);
PlayerTextDrawSetOutline(playerid, ItemEighteen[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, ItemEighteen[playerid], 51);
PlayerTextDrawFont(playerid, ItemEighteen[playerid], 1);
PlayerTextDrawSetProportional(playerid, ItemEighteen[playerid], 1);
PlayerTextDrawShow(playerid, PlayerText:ItemEighteen[playerid]);

ItemNineteen[playerid] = CreatePlayerTextDraw(playerid, 476.000000, 256.853302, "19.");
PlayerTextDrawLetterSize(playerid, ItemNineteen[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, ItemNineteen[playerid], 1);
PlayerTextDrawColor(playerid, ItemNineteen[playerid], -1);
PlayerTextDrawSetShadow(playerid, ItemNineteen[playerid], 0);
PlayerTextDrawSetOutline(playerid, ItemNineteen[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, ItemNineteen[playerid], 51);
PlayerTextDrawFont(playerid, ItemNineteen[playerid], 1);
PlayerTextDrawSetProportional(playerid, ItemNineteen[playerid], 1);
PlayerTextDrawShow(playerid, PlayerText:ItemNineteen[playerid]);

ItemTwenty[playerid] = CreatePlayerTextDraw(playerid, 476.000000, 264.319976, "20.");
PlayerTextDrawLetterSize(playerid, ItemTwenty[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, ItemTwenty[playerid], 1);
PlayerTextDrawColor(playerid, ItemTwenty[playerid], -1);
PlayerTextDrawSetShadow(playerid, ItemTwenty[playerid], 0);
PlayerTextDrawSetOutline(playerid, ItemTwenty[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, ItemTwenty[playerid], 51);
PlayerTextDrawFont(playerid, ItemTwenty[playerid], 1);
PlayerTextDrawSetProportional(playerid, ItemTwenty[playerid], 1);
PlayerTextDrawShow(playerid, PlayerText:ItemTwenty[playerid]);

EmptyOne[playerid] = CreatePlayerTextDraw(playerid, 486.400054, 123.199966, "Empty");
PlayerTextDrawLetterSize(playerid, EmptyOne[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, EmptyOne[playerid], 1);
PlayerTextDrawColor(playerid, EmptyOne[playerid], -1);
PlayerTextDrawSetShadow(playerid, EmptyOne[playerid], 0);
PlayerTextDrawSetOutline(playerid, EmptyOne[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, EmptyOne[playerid], 51);
PlayerTextDrawFont(playerid, EmptyOne[playerid], 1);
PlayerTextDrawSetProportional(playerid, EmptyOne[playerid], 1);
PlayerTextDrawShow(playerid, PlayerText:EmptyOne[playerid]);

EmptyTwo[playerid] = CreatePlayerTextDraw(playerid, 486.400024, 131.413314, "Empty");
PlayerTextDrawLetterSize(playerid, EmptyTwo[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, EmptyTwo[playerid], 1);
PlayerTextDrawColor(playerid, EmptyTwo[playerid], -1);
PlayerTextDrawSetShadow(playerid, EmptyTwo[playerid], 0);
PlayerTextDrawSetOutline(playerid, EmptyTwo[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, EmptyTwo[playerid], 51);
PlayerTextDrawFont(playerid, EmptyTwo[playerid], 1);
PlayerTextDrawSetProportional(playerid, EmptyTwo[playerid], 1);
PlayerTextDrawShow(playerid, PlayerText:EmptyTwo[playerid]);

EmptyThird[playerid] = CreatePlayerTextDraw(playerid, 488.000091, 138.879943, "Empty");
PlayerTextDrawLetterSize(playerid, EmptyThird[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, EmptyThird[playerid], 1);
PlayerTextDrawColor(playerid, EmptyThird[playerid], -1);
PlayerTextDrawSetShadow(playerid, EmptyThird[playerid], 0);
PlayerTextDrawSetOutline(playerid, EmptyThird[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, EmptyThird[playerid], 51);
PlayerTextDrawFont(playerid, EmptyThird[playerid], 1);
PlayerTextDrawSetProportional(playerid, EmptyThird[playerid], 1);
PlayerTextDrawShow(playerid, PlayerText:EmptyThird[playerid]);

EmptyFour[playerid] = CreatePlayerTextDraw(playerid, 487.999938, 146.346527, "Empty");
PlayerTextDrawLetterSize(playerid, EmptyFour[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, EmptyFour[playerid], 1);
PlayerTextDrawColor(playerid, EmptyFour[playerid], -1);
PlayerTextDrawSetShadow(playerid, EmptyFour[playerid], 0);
PlayerTextDrawSetOutline(playerid, EmptyFour[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, EmptyFour[playerid], 51);
PlayerTextDrawFont(playerid, EmptyFour[playerid], 1);
PlayerTextDrawSetProportional(playerid, EmptyFour[playerid], 1);
PlayerTextDrawShow(playerid, PlayerText:EmptyFour[playerid]);

EmptyFive[playerid] = CreatePlayerTextDraw(playerid, 488.000091, 153.813339, "Empty");
PlayerTextDrawLetterSize(playerid, EmptyFive[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, EmptyFive[playerid], 1);
PlayerTextDrawColor(playerid, EmptyFive[playerid], -1);
PlayerTextDrawSetShadow(playerid, EmptyFive[playerid], 0);
PlayerTextDrawSetOutline(playerid, EmptyFive[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, EmptyFive[playerid], 51);
PlayerTextDrawFont(playerid, EmptyFive[playerid], 1);
PlayerTextDrawSetProportional(playerid, EmptyFive[playerid], 1);
PlayerTextDrawShow(playerid, PlayerText:EmptyFive[playerid]);

EmptySix[playerid] = CreatePlayerTextDraw(playerid, 488.000122, 161.279983, "Empty");
PlayerTextDrawLetterSize(playerid, EmptySix[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, EmptySix[playerid], 1);
PlayerTextDrawColor(playerid, EmptySix[playerid], -1);
PlayerTextDrawSetShadow(playerid, EmptySix[playerid], 0);
PlayerTextDrawSetOutline(playerid, EmptySix[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, EmptySix[playerid], 51);
PlayerTextDrawFont(playerid, EmptySix[playerid], 1);
PlayerTextDrawSetProportional(playerid, EmptySix[playerid], 1);
PlayerTextDrawShow(playerid, PlayerText:EmptySix[playerid]);

EmptySeven[playerid] = CreatePlayerTextDraw(playerid, 488.000244, 168.746612, "Empty");
PlayerTextDrawLetterSize(playerid, EmptySeven[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, EmptySeven[playerid], 1);
PlayerTextDrawColor(playerid, EmptySeven[playerid], -1);
PlayerTextDrawSetShadow(playerid, EmptySeven[playerid], 0);
PlayerTextDrawSetOutline(playerid, EmptySeven[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, EmptySeven[playerid], 51);
PlayerTextDrawFont(playerid, EmptySeven[playerid], 1);
PlayerTextDrawSetProportional(playerid, EmptySeven[playerid], 1);
PlayerTextDrawShow(playerid, PlayerText:EmptySeven[playerid]);

EmptyEight[playerid] = CreatePlayerTextDraw(playerid, 488.800140, 176.213333, "Empty");
PlayerTextDrawLetterSize(playerid, EmptyEight[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, EmptyEight[playerid], 1);
PlayerTextDrawColor(playerid, EmptyEight[playerid], -1);
PlayerTextDrawSetShadow(playerid, EmptyEight[playerid], 0);
PlayerTextDrawSetOutline(playerid, EmptyEight[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, EmptyEight[playerid], 51);
PlayerTextDrawFont(playerid, EmptyEight[playerid], 1);
PlayerTextDrawSetProportional(playerid, EmptyEight[playerid], 1);
PlayerTextDrawShow(playerid, PlayerText:EmptyEight[playerid]);

EmptyNine[playerid] = CreatePlayerTextDraw(playerid, 490.400054, 183.679916, "Empty");
PlayerTextDrawLetterSize(playerid, EmptyNine[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, EmptyNine[playerid], 1);
PlayerTextDrawColor(playerid, EmptyNine[playerid], -1);
PlayerTextDrawSetShadow(playerid, EmptyNine[playerid], 0);
PlayerTextDrawSetOutline(playerid, EmptyNine[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, EmptyNine[playerid], 51);
PlayerTextDrawFont(playerid, EmptyNine[playerid], 1);
PlayerTextDrawSetProportional(playerid, EmptyNine[playerid], 1);
PlayerTextDrawShow(playerid, PlayerText:EmptyNine[playerid]);

EmptyTen[playerid] = CreatePlayerTextDraw(playerid, 490.400085, 191.146682, "Empty");
PlayerTextDrawLetterSize(playerid, EmptyTen[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, EmptyTen[playerid], 1);
PlayerTextDrawColor(playerid, EmptyTen[playerid], -1);
PlayerTextDrawSetShadow(playerid, EmptyTen[playerid], 0);
PlayerTextDrawSetOutline(playerid, EmptyTen[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, EmptyTen[playerid], 51);
PlayerTextDrawFont(playerid, EmptyTen[playerid], 1);
PlayerTextDrawSetProportional(playerid, EmptyTen[playerid], 1);
PlayerTextDrawShow(playerid, PlayerText:EmptyTen[playerid]);

EmptyEleven[playerid] = CreatePlayerTextDraw(playerid, 490.400054, 198.613327, "Empty");
PlayerTextDrawLetterSize(playerid, EmptyEleven[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, EmptyEleven[playerid], 1);
PlayerTextDrawColor(playerid, EmptyEleven[playerid], -1);
PlayerTextDrawSetShadow(playerid, EmptyEleven[playerid], 0);
PlayerTextDrawSetOutline(playerid, EmptyEleven[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, EmptyEleven[playerid], 51);
PlayerTextDrawFont(playerid, EmptyEleven[playerid], 1);
PlayerTextDrawSetProportional(playerid, EmptyEleven[playerid], 1);
PlayerTextDrawShow(playerid, PlayerText:EmptyEleven[playerid]);

EmptyTwelve[playerid] = CreatePlayerTextDraw(playerid, 490.400115, 206.080001, "Empty");
PlayerTextDrawLetterSize(playerid, EmptyTwelve[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, EmptyTwelve[playerid], 1);
PlayerTextDrawColor(playerid, EmptyTwelve[playerid], -1);
PlayerTextDrawSetShadow(playerid, EmptyTwelve[playerid], 0);
PlayerTextDrawSetOutline(playerid, EmptyTwelve[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, EmptyTwelve[playerid], 51);
PlayerTextDrawFont(playerid, EmptyTwelve[playerid], 1);
PlayerTextDrawSetProportional(playerid, EmptyTwelve[playerid], 1);
PlayerTextDrawShow(playerid, PlayerText:EmptyTwelve[playerid]);

EmptyThirdteen[playerid] = CreatePlayerTextDraw(playerid, 490.400238, 212.799942, "Empty");
PlayerTextDrawLetterSize(playerid, EmptyThirdteen[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, EmptyThirdteen[playerid], 1);
PlayerTextDrawColor(playerid, EmptyThirdteen[playerid], -1);
PlayerTextDrawSetShadow(playerid, EmptyThirdteen[playerid], 0);
PlayerTextDrawSetOutline(playerid, EmptyThirdteen[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, EmptyThirdteen[playerid], 51);
PlayerTextDrawFont(playerid, EmptyThirdteen[playerid], 1);
PlayerTextDrawSetProportional(playerid, EmptyThirdteen[playerid], 1);
PlayerTextDrawShow(playerid, PlayerText:EmptyThirdteen[playerid]);

EmptyFourteen[playerid] = CreatePlayerTextDraw(playerid, 490.399963, 220.266708, "Empty");
PlayerTextDrawLetterSize(playerid, EmptyFourteen[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, EmptyFourteen[playerid], 1);
PlayerTextDrawColor(playerid, EmptyFourteen[playerid], -1);
PlayerTextDrawSetShadow(playerid, EmptyFourteen[playerid], 0);
PlayerTextDrawSetOutline(playerid, EmptyFourteen[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, EmptyFourteen[playerid], 51);
PlayerTextDrawFont(playerid, EmptyFourteen[playerid], 1);
PlayerTextDrawSetProportional(playerid, EmptyFourteen[playerid], 1);
PlayerTextDrawShow(playerid, PlayerText:EmptyFourteen[playerid]);

EmptyFifthteen[playerid] = CreatePlayerTextDraw(playerid, 490.399963, 227.733291, "Empty");
PlayerTextDrawLetterSize(playerid, EmptyFifthteen[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, EmptyFifthteen[playerid], 1);
PlayerTextDrawColor(playerid, EmptyFifthteen[playerid], -1);
PlayerTextDrawSetShadow(playerid, EmptyFifthteen[playerid], 0);
PlayerTextDrawSetOutline(playerid, EmptyFifthteen[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, EmptyFifthteen[playerid], 51);
PlayerTextDrawFont(playerid, EmptyFifthteen[playerid], 1);
PlayerTextDrawSetProportional(playerid, EmptyFifthteen[playerid], 1);
PlayerTextDrawShow(playerid, PlayerText:EmptyFifthteen[playerid]);

EmptySixteen[playerid] = CreatePlayerTextDraw(playerid, 490.399993, 234.453369, "Empty");
PlayerTextDrawLetterSize(playerid, EmptySixteen[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, EmptySixteen[playerid], 1);
PlayerTextDrawColor(playerid, EmptySixteen[playerid], -1);
PlayerTextDrawSetShadow(playerid, EmptySixteen[playerid], 0);
PlayerTextDrawSetOutline(playerid, EmptySixteen[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, EmptySixteen[playerid], 51);
PlayerTextDrawFont(playerid, EmptySixteen[playerid], 1);
PlayerTextDrawSetProportional(playerid, EmptySixteen[playerid], 1);
PlayerTextDrawShow(playerid, PlayerText:EmptySixteen[playerid]);

EmptySeventeen[playerid] = CreatePlayerTextDraw(playerid, 491.200164, 242.666641, "Empty");
PlayerTextDrawLetterSize(playerid, EmptySeventeen[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, EmptySeventeen[playerid], 1);
PlayerTextDrawColor(playerid, EmptySeventeen[playerid], -1);
PlayerTextDrawSetShadow(playerid, EmptySeventeen[playerid], 0);
PlayerTextDrawSetOutline(playerid, EmptySeventeen[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, EmptySeventeen[playerid], 51);
PlayerTextDrawFont(playerid, EmptySeventeen[playerid], 1);
PlayerTextDrawSetProportional(playerid, EmptySeventeen[playerid], 1);
PlayerTextDrawShow(playerid, PlayerText:EmptySeventeen[playerid]);

EmptyEighteen[playerid] = CreatePlayerTextDraw(playerid, 491.199707, 249.386718, "Empty");
PlayerTextDrawLetterSize(playerid, EmptyEighteen[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, EmptyEighteen[playerid], 1);
PlayerTextDrawColor(playerid, EmptyEighteen[playerid], -1);
PlayerTextDrawSetShadow(playerid, EmptyEighteen[playerid], 0);
PlayerTextDrawSetOutline(playerid, EmptyEighteen[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, EmptyEighteen[playerid], 51);
PlayerTextDrawFont(playerid, EmptyEighteen[playerid], 1);
PlayerTextDrawSetProportional(playerid, EmptyEighteen[playerid], 1);
PlayerTextDrawShow(playerid, PlayerText:EmptyEighteen[playerid]);

EmptyNineteen[playerid] = CreatePlayerTextDraw(playerid, 491.200195, 256.853179, "Empty");
PlayerTextDrawLetterSize(playerid, EmptyNineteen[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, EmptyNineteen[playerid], 1);
PlayerTextDrawColor(playerid, EmptyNineteen[playerid], -1);
PlayerTextDrawSetShadow(playerid, EmptyNineteen[playerid], 0);
PlayerTextDrawSetOutline(playerid, EmptyNineteen[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, EmptyNineteen[playerid], 51);
PlayerTextDrawFont(playerid, EmptyNineteen[playerid], 1);
PlayerTextDrawSetProportional(playerid, EmptyNineteen[playerid], 1);
PlayerTextDrawShow(playerid, PlayerText:EmptyNineteen[playerid]);

EmptyTwenty[playerid] = CreatePlayerTextDraw(playerid, 492.799896, 264.319946, "Empty");
PlayerTextDrawLetterSize(playerid, EmptyTwenty[playerid], 0.300000, 1.000000);
PlayerTextDrawAlignment(playerid, EmptyTwenty[playerid], 1);
PlayerTextDrawColor(playerid, EmptyTwenty[playerid], -1);
PlayerTextDrawSetShadow(playerid, EmptyTwenty[playerid], 0);
PlayerTextDrawSetOutline(playerid, EmptyTwenty[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, EmptyTwenty[playerid], 51);
PlayerTextDrawFont(playerid, EmptyTwenty[playerid], 1);
PlayerTextDrawSetProportional(playerid, EmptyTwenty[playerid], 1);
PlayerTextDrawShow(playerid, PlayerText:EmptyTwenty[playerid]);


}
