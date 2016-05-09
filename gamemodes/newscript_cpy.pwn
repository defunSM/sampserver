#include <a_samp>
#include <core>
#include <float>
#include <strlib>
#include <YSI\y_commands>
#include <YSI\y_ini>
#include <sscanf2>
#include <progress2>

//Dialog Defines
#define DIALOG_REGISTER 1
#define DIALOG_LOGIN 2
#define DIALOG_SUCCESS_1 3
#define DIALOG_SUCCESS_2 4
#define SKILL_DIALOG 5
#define SKILL_DIALOG_VAMPIREJUMP 130
#define VEHICLE_MENU_ONE 120
#define VEHICLE_MENU_ENGINE 121
#define VEHICLE_MENU_LIGHTS 122
#define VEHICLE_MENU_ALARM 123
#define VEHICLE_MENU_DOOR 124
#define VEHICLE_MENU_BONNET 125
#define VEHICLE_MENU_TRUNK 126
#define VEHICLE_MENU_CONDITION 127
#define ADMIN_ARMOUR 150
#define ADMIN_ARMOUR_2 151
#define MAX_VEHICLES_ON_SERVER 100

//Define Pressed Key
#define PRESSED(%0) \
	(((newkeys & (%0)) == (%0)) && ((oldkeys & (%0)) != (%0)))

//Color Defines
#define COLOR_MAROON 0x66000055
#define COLOR_INDIGO 0x6666ff55
#define COLOR_CYAN 0x4dffffFF
#define COL_WHITE "{FFFFFF}"
#define COL_RED "{F81414}"
#define COL_GREEN "{00FF22}"
#define COL_LIGHTBLUE "{00CED1}"
#define COL_MAROON "{660000}"
#define COL_INDIGO "{6666ff}"
#define COL_CYAN "{4dffff}"

//Menu

new PlayerText:Slot0[MAX_PLAYERS];
new PlayerText:Slot1[MAX_PLAYERS];
new PlayerText:Slot2[MAX_PLAYERS];

new PlayerText:expstat[MAX_PLAYERS];
new PlayerText:levelstat[MAX_PLAYERS];



ShowInventory(playerid){
    
    
    Slot0[playerid] = CreatePlayerTextDraw(playerid, 367.200042, 251.626602, "Slot 0");
	PlayerTextDrawLetterSize(playerid, Slot0[playerid], 0.300000, 1.000000);
	PlayerTextDrawAlignment(playerid, Slot0[playerid], 1);
	PlayerTextDrawColor(playerid, Slot0[playerid], 16777215);
	PlayerTextDrawSetShadow(playerid, Slot0[playerid], 0);
	PlayerTextDrawSetOutline(playerid, Slot0[playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, Slot0[playerid], 51);
	PlayerTextDrawFont(playerid, Slot0[playerid], 1);
	PlayerTextDrawSetProportional(playerid, Slot0[playerid], 1);

	Slot1[playerid] = CreatePlayerTextDraw(playerid, 367.200012, 242.666625, "Slot 1");
	PlayerTextDrawLetterSize(playerid, Slot1[playerid], 0.200000, 1.000000);
	PlayerTextDrawTextSize(playerid, Slot1[playerid], 1.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, Slot1[playerid], 1);
	PlayerTextDrawColor(playerid, Slot1[playerid], -1);
	PlayerTextDrawSetShadow(playerid, Slot1[playerid], 0);
	PlayerTextDrawSetOutline(playerid, Slot1[playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, Slot1[playerid], 51);
	PlayerTextDrawFont(playerid, Slot1[playerid], 1);
	PlayerTextDrawSetProportional(playerid, Slot1[playerid], 1);


	Slot2[playerid] = CreatePlayerTextDraw(playerid, 368.000000, 261.333343, "Slot 2");
	PlayerTextDrawLetterSize(playerid, Slot2[playerid], 0.200000, 1.000000);
	PlayerTextDrawAlignment(playerid, Slot2[playerid], 1);
	PlayerTextDrawColor(playerid, Slot2[playerid], -1);
	PlayerTextDrawSetShadow(playerid, Slot2[playerid], 0);
	PlayerTextDrawSetOutline(playerid, Slot2[playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, Slot2[playerid], 51);
	PlayerTextDrawFont(playerid, Slot2[playerid], 1);
	PlayerTextDrawSetProportional(playerid, Slot2[playerid], 1);
	
	PlayerTextDrawShow(playerid, PlayerText:Slot0[playerid]);
    PlayerTextDrawShow(playerid, PlayerText:Slot1[playerid]);
    PlayerTextDrawShow(playerid, PlayerText:Slot2[playerid]);
	return 1;
}



new PlayerText:iTDBottomMenu[MAX_PLAYERS];

new pEXPBarID[MAX_PLAYERS];
new pJumpBarID[MAX_PLAYERS];

enum temp
{
	temp01,
	temp02,
	temp03,
	Float:temp04,
	Float:temp05,
	Float:temp06,
	temp07
}


new Assign[temp];
//Login/Register System Script
enum pInfo
{
    pPass,
    pCash,
    pAdmin,
    pKills,
    pDeaths,
    Float:pX,
    Float:pY,
    Float:pZ,
	Float:pAngle,
	pInterior,
	pVirtualWorld,
	pSkin,
	pRace,
	pVampireJump,
	Float:pEXPBarValue,
	pEXP,
	pMaxEXP,
	Float:pMaxEXPBarValue,
	Float:pHealth,
	Float:pArmour
}
new PlayerInfo[MAX_PLAYERS][pInfo];

enum pVeh
{
	VEHICLE_ID,
	VEHICLE_LOCKED,
	VEHICLE_GAS,
	VEHICLE_HEALTH,
	VEHICLE_OWNER
}
new Vehicle[MAX_VEHICLES_ON_SERVER][pVeh];



forward JumpDisable(playerid);

forward LoadUser_data(playerid,name[],value[]);
public LoadUser_data(playerid,name[],value[])
{
    INI_Int("Password",PlayerInfo[playerid][pPass]);
    INI_Int("Cash",PlayerInfo[playerid][pCash]);
    INI_Int("Admin",PlayerInfo[playerid][pAdmin]);
    INI_Int("Kills",PlayerInfo[playerid][pKills]);
    INI_Int("Deaths",PlayerInfo[playerid][pDeaths]);
    INI_Float("pX",PlayerInfo[playerid][pX]);
    INI_Float("pY",PlayerInfo[playerid][pY]);
    INI_Float("pZ",PlayerInfo[playerid][pZ]);
    INI_Float("pAngle",PlayerInfo[playerid][pAngle]);
    INI_Int("pInterior",PlayerInfo[playerid][pInterior]);
	INI_Int("pVirtualWorld",PlayerInfo[playerid][pVirtualWorld]);
	INI_Int("pSkin",PlayerInfo[playerid][pVirtualWorld]);
	INI_Int("pRace",PlayerInfo[playerid][pRace]);
	INI_Int("pVampireJump", PlayerInfo[playerid][pVampireJump]);
	INI_Float("pEXPBarValue", PlayerInfo[playerid][pEXPBarValue]);
	INI_Int("pEXP", PlayerInfo[playerid][pEXP]);
	INI_Int("pMaxEXP", PlayerInfo[playerid][pMaxEXP]);
	INI_Float("pMaxEXPBarValue", PlayerInfo[playerid][pMaxEXPBarValue]);
	INI_Float("pHealth", PlayerInfo[playerid][pHealth]);
	INI_Float("pArmour", PlayerInfo[playerid][pArmour]);
	return 1;
}

stock UserPath(playerid)
{
    new string[128],playername[MAX_PLAYER_NAME];
    GetPlayerName(playerid,playername,sizeof(playername));
    format(string,sizeof(string),"%s.ini",playername);
    return string;
}

/*Credits to Dracoblue*/
stock udb_hash(buf[]) {
    new length=strlen(buf);
    new s1 = 1;
    new s2 = 0;
    new n;
    for (n=0; n<length; n++)
    {
       s1 = (s1 + buf[n]) % 65521;
       s2 = (s2 + s1)     % 65521;
    }
    return (s2 << 16) + s1;
}

public OnPlayerConnect(playerid)
{

    if(fexist(UserPath(playerid)))
    {
        INI_ParseFile(UserPath(playerid), "LoadUser_%s", .bExtra = true, .extra = playerid);
        ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_INPUT,""COL_CYAN"Login",""COL_WHITE"Type your password below to login.","Login","Quit");
    }
    else
    {
        ShowPlayerDialog(playerid, DIALOG_REGISTER, DIALOG_STYLE_INPUT,""COL_CYAN"Register",""COL_WHITE"Type your password below to register a new account.","Register","Quit");
    }
    return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    switch( dialogid )
    {
        case DIALOG_REGISTER:
        {
            if (!response) return Kick(playerid);
            if(response)
            {
                if(!strlen(inputtext)) return ShowPlayerDialog(playerid, DIALOG_REGISTER, DIALOG_STYLE_INPUT, ""COL_CYAN"Register",""COL_RED"You have entered an invalid password.\n"COL_WHITE"Type your password below to register a new account.","Register","Quit");
                new INI:File = INI_Open(UserPath(playerid));
                INI_SetTag(File,"data");
                INI_WriteInt(File,"Password",udb_hash(inputtext));
                INI_WriteInt(File,"Cash",0);
                INI_WriteInt(File,"Admin",0);
                INI_WriteInt(File,"Kills",0);
                INI_WriteInt(File,"Deaths",0);
                INI_WriteFloat(File,"pX", 0.0);
                INI_WriteFloat(File,"pY", 0.0);
                INI_WriteFloat(File,"pZ", 0.0);
				INI_WriteFloat(File,"pAngle", 0.0);
				INI_WriteInt(File,"pInterior", 0);
				INI_WriteInt(File,"pVirtualWorld", 0);
				INI_WriteInt(File, "pSkin", 2);
				INI_WriteInt(File, "pRace", 0);
				INI_WriteInt(File, "pVampireJump", 0);
				INI_WriteFloat(File, "pEXPBarValue", 0.0);
				INI_WriteInt(File, "pEXP", 0);
				INI_WriteInt(File, "pMaxEXP", 4);
				INI_WriteFloat(File, "pMaxEXPBarValue", 4.0);
				INI_WriteFloat(File, "pHealth", 100.0);
				INI_WriteFloat(File, "pArmour", 0.0);
				INI_Close(File);
				
				INI_ParseFile(UserPath(playerid), "LoadUser_%s", .bExtra = true, .extra = playerid);
                SetSpawnInfo(playerid, 0,PlayerInfo[playerid][pSkin], 1958.33, 1343.12, 15.36, 269.15, 0, 0, 0, 0, 0, 0);
                SpawnPlayer(playerid);
                ShowPlayerDialog(playerid, DIALOG_SUCCESS_1, DIALOG_STYLE_MSGBOX,""COL_CYAN"Success",""COL_GREEN"Relog to save your stats!","Ok","");
            }
        }

        case DIALOG_LOGIN:
        {
            if ( !response ) return Kick ( playerid );
            if( response )
            {
                if(udb_hash(inputtext) == PlayerInfo[playerid][pPass])
                {
                    INI_ParseFile(UserPath(playerid), "LoadUser_%s", .bExtra = true, .extra = playerid);
                    GivePlayerMoney(playerid, PlayerInfo[playerid][pCash]);
					SetPlayerFacingAngle(playerid, PlayerInfo[playerid][pAngle]);
					SetPlayerInterior(playerid, PlayerInfo[playerid][pInterior]);
					SetPlayerVirtualWorld(playerid, PlayerInfo[playerid][pVirtualWorld]);
					SetPlayerSkin(playerid, PlayerInfo[playerid][pSkin]);
					SetPlayerArmour(playerid, PlayerInfo[playerid][pArmour]);
					
                    ShowPlayerDialog(playerid, DIALOG_SUCCESS_2, DIALOG_STYLE_MSGBOX,""COL_CYAN"Success",""COL_GREEN"You have successfully logged in!","Ok","");

					SetSpawnInfo(playerid, 0, PlayerInfo[playerid][pSkin], PlayerInfo[playerid][pX], PlayerInfo[playerid][pY], PlayerInfo[playerid][pZ], PlayerInfo[playerid][pAngle], 0, 0, 0, 0, 0, 0);
                	SpawnPlayer(playerid);
                }
                else
                {
                    ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_INPUT,""COL_CYAN"Login",""COL_RED"You have entered an incorrect password.\n"COL_WHITE"Type your password below to login.","Login","Quit");
                }
                return 1;
            }
        }
    }

    if(dialogid == 50 && response == 1)
	{
		switch(listitem)
		{
    	case 0: ShowPlayerDialog(playerid, 51, DIALOG_STYLE_MSGBOX, "{00C0FF}Rules", "Tele 1 \nTele 2 \nTele 3", "Ok", "Cancel");
		case 1: ShowPlayerDialog(playerid, 60, DIALOG_STYLE_LIST, "{00C0FF}Commands", "Spawn NPC\nCash\nTeleportXYZ\nSetSkin\nAddStaticVehicle\nSetHealth\nSetArmour", "Ok", "Cancel");
		case 2: ShowPlayerDialog(playerid, 52, DIALOG_STYLE_MSGBOX, "{00C0FF}Rules", "Ru 1 \nRule 2 \nRule 3", "Ok", "Cancel");
		case 3: ShowPlayerDialog(playerid, 53, DIALOG_STYLE_LIST, "{00C0FF}FireArm", "9mm \nSilenced 9mm\nDeagle\nShotgun\nSpawn-Off Shotgun\nSpas-12\nMac-9\nMP5\nAK47\nM4\nTec-9\nRifle\nSniper Rifle\nRPG\nHoming Rocket Launcher\nFlameThrower\nMinigun\nRemote C4\nRemote C4 Controller\nSpray Can\nFire Extinguisher\nCamera\nParachute", "Select", "Cancel");
        case 4: ShowPlayerDialog(playerid, 54, DIALOG_STYLE_LIST, "{00C0FF}Melee", "Brass Knuckles\nGolf Club\nNightStick\nKnife\nBaseball Bat\nShovel\nPool Cue\nKatana\nChainsaw\nPurple Dildo\nDildo\nVibrator\nSilver Vibrator\nFlowers\nCane\nGrenade\nTearGas\nMolotovCockTail", "Ok", "Cancel");
        case 5: ShowPlayerDialog(playerid, 55, DIALOG_STYLE_LIST, "{00C0FF}Race","Human\nVampire", "Select", "Cancel");
        case 6: ShowPlayerDialog(playerid, 56, DIALOG_STYLE_LIST, "{00C0FF}Stats", "Reset XP\n Set XP");
		}

	}
	
	if(dialogid == 56 && response == 1){
	    switch(listitem){
	        case 0: ShowPlayerDialog(playerid, 57, DIALOG_STYLE_INPUT, "RESET XP", "ENTER RESET XP TARGET:", "Confirm", "Cancel");
	        case 1: ShowPlayerDialog(playerid, 58, DIALOG_STYLE_INPUT, "SET XP", "ENTER XP TARGET:", "Confirm", "Cancel");
	 	}
	 	
	}
	
	if(dialogid == 57 && response == 1) {
	    Assign[temp01]=strval(inputtext);
		PlayerInfo[playerid][pEXP] = 0;
		new string[129];
		format(string, sizeof(string), "XP (%d/%d)", PlayerInfo[playerid][pEXP], PlayerInfo[playerid][pMaxEXP]);
		PlayerTextDrawSetString(playerid, PlayerText:expstat[playerid], string);
		SetPlayerProgressBarValue(0, pEXPBarID[Assign[temp01]], 0.0);
	    
	}
	
	if(dialogid == 59 && response == 1) {
	    Assign[temp02]=strval(inputtext);
		PlayerInfo[playerid][pEXP] = Assign[temp02];
		new string[129];
		format(string, sizeof(string), "XP (%d/%d)", PlayerInfo[playerid][pEXP], PlayerInfo[playerid][pMaxEXP]);
		PlayerTextDrawSetString(playerid, PlayerText:expstat[playerid], string);
		SetPlayerProgressBarValue(0, pEXPBarID[Assign[temp01]], PlayerInfo[playerid][pEXP]);

	}
	
	if(dialogid == 58 && response == 1) {
		Assign[temp01]=strval(inputtext);
		ShowPlayerDialog(playerid, 59, DIALOG_STYLE_INPUT, "ENTER AMOUNT OF XP", "AMOUNT:", "Confirm", "Cancel");
	}
	
	if(dialogid == 60 && response == 1){

		switch(listitem)
		{
		case 0: SendClientMessage(playerid, COLOR_CYAN, "You have spawned a Robot.");
		case 1: ShowPlayerDialog(playerid, 70, DIALOG_STYLE_INPUT, "Cash", "Target ID:", "Confirm", "Cancel");
		case 2: ShowPlayerDialog(playerid, 80, DIALOG_STYLE_INPUT, "Teleport","Enter X Coordinate:", "Confirm", "Cancel" );
		case 3: ShowPlayerDialog(playerid, 90, DIALOG_STYLE_INPUT, "SetSkin", "Enter Target ID:", "Confirm", "Cancel");
		case 4: ShowPlayerDialog(playerid, 100, DIALOG_STYLE_INPUT, "AddStaticVeh", "Enter Vehicle ID (400-611):", "Confirm", "Cancel");
		case 5: ShowPlayerDialog(playerid, 101, DIALOG_STYLE_INPUT, "Health", "Enter Target ID:", "Confirm", "Cancel");
		case 6: ShowPlayerDialog(playerid, ADMIN_ARMOUR, DIALOG_STYLE_INPUT, "Armour", "Enter Target ID:", "Confirm", "Cancel");
		}
	}
	
	if(dialogid == ADMIN_ARMOUR && response == 1) {
	    Assign[temp01]=strval(inputtext);
	    ShowPlayerDialog(playerid, ADMIN_ARMOUR_2, DIALOG_STYLE_INPUT, "Armour Amount", "Enter amount of armour:", "Confirm", "Cancel");
	    
	}
	
	if(dialogid == ADMIN_ARMOUR_2 && response == 1) {
	    PlayerInfo[playerid][pArmour]=strval(inputtext);
	    SetPlayerArmour(Assign[temp01], PlayerInfo[playerid][pArmour]);
	    SendClientMessage(Assign[temp01], COLOR_CYAN, "[ADMIN] Your character has been given armour.");
	}
	
	
	if(dialogid == 101 && response == 1) {
	    Assign[temp01]=strval(inputtext);
	    ShowPlayerDialog(playerid, 102, DIALOG_STYLE_INPUT, "Health", "Enter Amount of Health:", "Confirm", "Cancel");
	}
	
	if(dialogid == 102 && response == 1) {
		new Float:number;
		number=strval(inputtext);
	    SetPlayerHealth(Assign[temp01], number);
	}
	
	
	
	if(dialogid == 100 && response == 1) {
		new number;
		number=strval(inputtext);
		printf("%d", number);
		GetPlayerPos(playerid, PlayerInfo[playerid][pX], PlayerInfo[playerid][pY], PlayerInfo[playerid][pZ]);
		GetPlayerFacingAngle(playerid, PlayerInfo[playerid][pAngle]);
	    AddStaticVehicle(number, PlayerInfo[playerid][pX]+1.0, PlayerInfo[playerid][pY]+1.0, PlayerInfo[playerid][pZ], PlayerInfo[playerid][pAngle], 0, 0);
	}

	if(dialogid == 90 && response == 1) {
		Assign[temp01]=strval(inputtext);
	    ShowPlayerDialog(playerid, 91, DIALOG_STYLE_INPUT, "SetSkin", "Enter Skin ID:", "Confirm", "Cancel");
	}

	if(dialogid == 91 && response == 1) {
	    Assign[temp02]=strval(inputtext);
		SetPlayerSkin(Assign[temp01], Assign[temp02]);
		PlayerInfo[playerid][pSkin]=Assign[temp02];
	}

	if(dialogid == 80 && response == 1) {
	    Assign[temp04]=strval(inputtext);
	    ShowPlayerDialog(playerid, 81, DIALOG_STYLE_INPUT, "Teleport", "Enter Y Coordinate:", "Confirm", "Cancel");
	}

    if(dialogid == 81 && response == 1) {
	    Assign[temp05]=strval(inputtext);
	    ShowPlayerDialog(playerid, 82, DIALOG_STYLE_INPUT, "Teleport", "Enter Z Coordinate:", "Confirm", "Cancel");
	}

	if(dialogid == 82 && response == 1) {
	    Assign[temp06]=strval(inputtext);
     	ShowPlayerDialog(playerid, 83, DIALOG_STYLE_INPUT, "Teleport", "Enter Interior ID:", "Confirm", "Cancel");
	}

	if(dialogid == 84 && response == 1) {
	    Assign[temp01]=strval(inputtext);
	    ShowPlayerDialog(playerid, 85, DIALOG_STYLE_INPUT, "Teleport", "Enter Target ID:", "Confirm", "Cancel");
	}

	if(dialogid == 83 && response == 1) {
 		Assign[temp02]=strval(inputtext);
 		SetPlayerPos(Assign[temp02],Assign[temp04],Assign[temp05],Assign[temp06]);
		SetPlayerPos(Assign[temp02],Assign[temp01]);
	}



	if(dialogid == 70 && response == 1){
		Assign[temp01]=strval(inputtext);
		ShowPlayerDialog(playerid, 71, DIALOG_STYLE_INPUT, "/GiveCash", "Amount:", "Confirm", "Cancel");

 	}
 	if(dialogid == 71 && response == 1) {
		Assign[temp02]=strval(inputtext);
		GivePlayerMoney(Assign[temp01], Assign[temp02]);
	}

	if(dialogid == 55 && response == 1){
		if(listitem==0)
		{
			PlayerInfo[playerid][pRace] = 0;
			PlayerInfo[playerid][pVampireJump]=0;
			SendClientMessage(playerid, COLOR_CYAN, "[Character] You are now a {00FF22}human.{00FF22}");

		} else if(listitem==1) {
		    PlayerInfo[playerid][pRace] = 1;
		    PlayerInfo[playerid][pVampireJump]=0;
		    SendClientMessage(playerid, COLOR_CYAN, "[Character] You are now a {660000}vampire.{660000}");
		}
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

	if(dialogid == SKILL_DIALOG && response == 1)
	{
		if(listitem==0){
		    ShowPlayerSkills(playerid);
		
		} else if(listitem==1) {
		    ShowPlayerSkills(playerid);
		
		} else if(listitem==2) {

			ShowPlayerDialog(playerid, SKILL_DIALOG_VAMPIREJUMP, DIALOG_STYLE_MSGBOX, "Vampiric Jump", "Are you sure you want to add a point to vampire jump?", "Confirm", "Cancel");
			
	    }
	}
	
	if(dialogid == SKILL_DIALOG_VAMPIREJUMP && response == 1)
	{   if(PlayerInfo[playerid][pRace]==1){
		    SendClientMessage(playerid, COLOR_CYAN, "[Character] You have added a point in {FFFFFF}vampiric jump.{FFFFFF}");
		    PlayerInfo[playerid][pVampireJump]=1;
	        new string[129];
			format(string, sizeof(string), "VampireJump(%d/3)", PlayerInfo[playerid][pVampireJump]);
			ShowPlayerDialog(playerid, 131, DIALOG_STYLE_LIST, "Skills", string, "Select", "Cancel");
		} else {
		
		    SendClientMessage(playerid, COLOR_CYAN, "ERROR: You are not a {FFFFFF}vampire.{FFFFFF}");
		}
	}
	
	if(dialogid == VEHICLE_MENU_ONE && response == 1)
	{
	    switch(listitem)
	    {
	        case 0: ShowPlayerDialog(playerid, VEHICLE_MENU_ENGINE, DIALOG_STYLE_MSGBOX, "Vehicle Engine", "You are accessing the engine...", "Confirm", "Back");
	        case 1: ShowPlayerDialog(playerid, VEHICLE_MENU_LIGHTS, DIALOG_STYLE_MSGBOX, "Vehicle Lights", "You are accessing the lights...", "Confirm", "Back");
			case 2: ShowPlayerDialog(playerid, VEHICLE_MENU_ALARM, DIALOG_STYLE_MSGBOX, "Vehicle Alarm", "You are accessing the alarm...", "Confirm", "Back");
            case 3: ShowPlayerDialog(playerid, VEHICLE_MENU_DOOR, DIALOG_STYLE_MSGBOX, "Vehicle Doors", "You are accessing the door locks...", "Confirm", "Back");
            case 4: ShowPlayerDialog(playerid, VEHICLE_MENU_BONNET, DIALOG_STYLE_MSGBOX, "Vehicle Bonnet", "You are accessing the bonnet...", "Confirm", "Back");
            case 5: ShowPlayerDialog(playerid, VEHICLE_MENU_TRUNK, DIALOG_STYLE_MSGBOX, "Vehicle Trunk", "You are accessing the trunk...", "Confirm", "Back");
			case 6: ShowPlayerDialog(playerid, VEHICLE_MENU_CONDITION, DIALOG_STYLE_MSGBOX, "Vehicle Condition", "You are accessing the condition of the vehicle...", "Confirm", "Back");
			
		}
	}
	
	
	if(dialogid == VEHICLE_MENU_ENGINE && response == 1)
	{
	    new engid, lighid, alarmid, doorid, bonnetid, bootid, objectiveid;
	    GetVehicleParamsEx(GetPlayerVehicleID(playerid), engid, lighid, alarmid, doorid, bonnetid, bootid, objectiveid);
		if(engid==0)
		{
			SetVehicleParamsEx(GetPlayerVehicleID(playerid), 1, lighid, alarmid, doorid, bonnetid, bootid, objectiveid);
			SendClientMessage(playerid, COLOR_CYAN, "[Character] You have turned "COL_WHITE"ON"COL_CYAN" the vehicle's engine.");
		}
		else
		{
            SetVehicleParamsEx(GetPlayerVehicleID(playerid), 0, lighid, alarmid, doorid, bonnetid, bootid, objectiveid);
            SendClientMessage(playerid, COLOR_CYAN, "[Character] You have turned "COL_WHITE"OFF"COL_CYAN" the vehicle's engine.");
		}
		ShowVehicleOptions(playerid);
		
	}
	
    if(dialogid == VEHICLE_MENU_LIGHTS && response == 1)
	{
	    new engid, lighid, alarmid, doorid, bonnetid, bootid, objectiveid;
	    GetVehicleParamsEx(GetPlayerVehicleID(playerid), engid, lighid, alarmid, doorid, bonnetid, bootid, objectiveid);
		if(lighid==0)
		{
			SetVehicleParamsEx(GetPlayerVehicleID(playerid), engid, 1, alarmid, doorid, bonnetid, bootid, objectiveid);
			SendClientMessage(playerid, COLOR_CYAN, "[Character] You have turned "COL_WHITE"OFF"COL_CYAN" the vehicle headlights.");
		}
		else
		{
            SetVehicleParamsEx(GetPlayerVehicleID(playerid), engid, 0, alarmid, doorid, bonnetid, bootid, objectiveid);
            SendClientMessage(playerid, COLOR_CYAN, "[Character] You have turned "COL_WHITE"ON"COL_CYAN" the vehicle headlights.");
		}
		ShowVehicleOptions(playerid);
	}
	

	if(dialogid == VEHICLE_MENU_ALARM && response == 1)
	{
	    new engid, lighid, alarmid, doorid, bonnetid, bootid, objectiveid;
	    GetVehicleParamsEx(GetPlayerVehicleID(playerid), engid, lighid, alarmid, doorid, bonnetid, bootid, objectiveid);
		if(alarmid==0)
		{
			SetVehicleParamsEx(GetPlayerVehicleID(playerid), engid, lighid, 1, doorid, bonnetid, bootid, 1);
			SendClientMessage(playerid, COLOR_CYAN, "[Character] You have turned "COL_WHITE"ON"COL_CYAN" the alarm.");
		}
		else
		{
            SetVehicleParamsEx(GetPlayerVehicleID(playerid), engid, lighid, 0, doorid, bonnetid, bootid, 0);
            SendClientMessage(playerid, COLOR_CYAN, "[Character] You have turned "COL_WHITE"OFF"COL_CYAN" the alarm.");
		}
		ShowVehicleOptions(playerid);
	}
	

    if(dialogid == VEHICLE_MENU_DOOR && response == 1)
	{
	    new engid, lighid, alarmid, doorid, bonnetid, bootid, objectiveid;
	    GetVehicleParamsEx(GetPlayerVehicleID(playerid), engid, lighid, alarmid, doorid, bonnetid, bootid, objectiveid);
		if(doorid==0)
		{
			SetVehicleParamsEx(GetPlayerVehicleID(playerid), engid, lighid, alarmid, 1, bonnetid, bootid, objectiveid);
			SendClientMessage(playerid, COLOR_CYAN, "[Character] You have "COL_WHITE"LOCKED"COL_CYAN" the doors.");
		}
		else
		{
            SetVehicleParamsEx(GetPlayerVehicleID(playerid), engid, lighid, alarmid, 0, bonnetid, bootid, objectiveid);
            SendClientMessage(playerid, COLOR_CYAN, "[Character] You have "COL_WHITE"UNLOCKED"COL_CYAN" the doors.");
		}
		ShowVehicleOptions(playerid);
	}
	
	
    if(dialogid == VEHICLE_MENU_BONNET && response == 1)
	{
	    new engid, lighid, alarmid, doorid, bonnetid, bootid, objectiveid;
	    GetVehicleParamsEx(GetPlayerVehicleID(playerid), engid, lighid, alarmid, doorid, bonnetid, bootid, objectiveid);
		if(bonnetid==0)
		{
			SetVehicleParamsEx(GetPlayerVehicleID(playerid), engid, lighid, alarmid, doorid, 1, bootid, objectiveid);
			SendClientMessage(playerid, COLOR_CYAN, "[Character] You have "COL_WHITE"OPENED"COL_CYAN" the bonnet.");
		}
		else
		{
            SetVehicleParamsEx(GetPlayerVehicleID(playerid), engid, lighid, alarmid, doorid, 0, bootid, objectiveid);
            SendClientMessage(playerid, COLOR_CYAN, "[Character] You have "COL_WHITE"CLOSED"COL_CYAN" the bonnet.");
		}
		ShowVehicleOptions(playerid);
	}
	
    if(dialogid == VEHICLE_MENU_TRUNK && response == 1)
	{
	    new engid, lighid, alarmid, doorid, bonnetid, bootid, objectiveid;
	    GetVehicleParamsEx(GetPlayerVehicleID(playerid), engid, lighid, alarmid, doorid, bonnetid, bootid, objectiveid);
		if(bootid==0)
		{
			SetVehicleParamsEx(GetPlayerVehicleID(playerid), engid, lighid, alarmid, doorid, bonnetid, 1, objectiveid);
			SendClientMessage(playerid, COLOR_CYAN, "[Character] You have "COL_WHITE"OPENED"COL_CYAN" the trunk.");
		}
		else
		{
            SetVehicleParamsEx(GetPlayerVehicleID(playerid), engid, lighid, alarmid, doorid, bonnetid, 1, objectiveid);
            SendClientMessage(playerid, COLOR_CYAN, "[Character] You have "COL_WHITE"CLOSED"COL_CYAN" the trunk.");
		}
		ShowVehicleOptions(playerid);
	}
	
    if(dialogid == VEHICLE_MENU_CONDITION && response == 1)
	{
	    new Float:VehicleHealth, string[129];
	    GetVehicleHealth(GetPlayerVehicleID(playerid), VehicleHealth);
	    format(string, sizeof(string), "[Character] The condition of the vehicle is at {FFFFFF}%f{FFFFFF}", VehicleHealth);
	    SendClientMessage(playerid, COLOR_CYAN, string);
	    ShowVehicleOptions(playerid);
	}
	
	
    return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	GetPlayerPos(playerid, PlayerInfo[playerid][pX], PlayerInfo[playerid][pY], PlayerInfo[playerid][pZ]);
	GetPlayerFacingAngle(playerid, PlayerInfo[playerid][pAngle]);
	PlayerInfo[playerid][pInterior]=GetPlayerInterior(playerid);
	PlayerInfo[playerid][pVirtualWorld]=GetPlayerVirtualWorld(playerid);
	PlayerInfo[playerid][pSkin]=GetPlayerSkin(playerid);
    new INI:File = INI_Open(UserPath(playerid));
    INI_SetTag(File,"data");
    INI_WriteInt(File,"Cash", GetPlayerMoney(playerid));
    INI_WriteInt(File,"Admin", PlayerInfo[playerid][pAdmin]);
    INI_WriteInt(File,"Kills", PlayerInfo[playerid][pKills]);
    INI_WriteInt(File,"Deaths", PlayerInfo[playerid][pDeaths]);
	INI_WriteFloat(File,"pX", PlayerInfo[playerid][pX]);
	INI_WriteFloat(File,"pY", PlayerInfo[playerid][pY]);
	INI_WriteFloat(File,"pZ", PlayerInfo[playerid][pZ]);
	INI_WriteFloat(File,"pAngle", PlayerInfo[playerid][pAngle]);
	INI_WriteInt(File,"pInterior", PlayerInfo[playerid][pInterior]);
	INI_WriteInt(File,"pVirtualWorld", PlayerInfo[playerid][pVirtualWorld]);
	INI_WriteInt(File,"pSkin", PlayerInfo[playerid][pSkin]);
	INI_WriteInt(File, "pRace", PlayerInfo[playerid][pRace]);
	INI_WriteInt(File, "pVampireJump", PlayerInfo[playerid][pVampireJump]);
	INI_WriteFloat(File, "pEXPBarValue", PlayerInfo[playerid][pEXPBarValue]);
	INI_WriteInt(File, "pEXP", PlayerInfo[playerid][pEXP]);
	INI_WriteInt(File, "pMaxEXP", PlayerInfo[playerid][pMaxEXP]);
	INI_WriteFloat(File, "pMaxEXPBarValue", PlayerInfo[playerid][pMaxEXPBarValue]);
	INI_WriteFloat(File, "pHealth", PlayerInfo[playerid][pHealth]);
	INI_WriteFloat(File, "pArmour", PlayerInfo[playerid][pArmour]);



	INI_Close(File);
    return 1;
}

public OnPlayerSpawn(playerid)
{
    AddPlayerClass(PlayerInfo[playerid][pSkin], 1958.33, 1343.12, 15.36, 269.15,0, 0, 0,0,0,0);
	Assign[temp07]=0;
	DisplayBars(playerid);
	DisplayBottomMenu(playerid);
	DisplayEXP(playerid);
	DisplayLevel(playerid);
    return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
    PlayerInfo[killerid][pKills]++;
    PlayerInfo[playerid][pDeaths]++;
    return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(PRESSED(KEY_JUMP) & PlayerInfo[playerid][pRace] == 1)
	{

	    new Float:SuperJump[3];
		GetPlayerVelocity(playerid, SuperJump[0], SuperJump[1], SuperJump[2]);
		SetPlayerVelocity(playerid, SuperJump[0], SuperJump[1], SuperJump[2]+PlayerInfo[playerid][pVampireJump]);
		SetTimer("JumpDisable", 1, false);
 	}

	return 1;
}


public JumpDisable(playerid){
	PlayerInfo[playerid][pVampireJump]=0;
	SetTimer("JumpEnable", 2000, false);
	return 1;
}

forward JumpEnable(playerid);

public JumpEnable(playerid) {
	PlayerInfo[playerid][pVampireJump]=1;
	return 1;
}

public OnPlayerText(playerid, text[])
{
    new pText[144];
    format(pText, sizeof (pText), "[ID:%d] %s", playerid, text);
    SendPlayerMessageToAll(playerid, pText);
    return 0; // ignore the default text and send the custom one
}


// CMD COMMANDS

CMD:admin(playerid, params[])
{
	ShowPlayerDialog(playerid, 50, DIALOG_STYLE_LIST, ""COL_CYAN"AdminCMD", "Rules\nCommands\nJobs\nFireArms\nMelee\nRace\nStats", "Select", "Cancel");

	return 1;
}
CMD:skills(playerid, params[])
{
	ShowPlayerSkills(playerid);
	return 1;
}

CMD:showinv(playerid, params[])
{
	ShowInventory(playerid);
	SetTimer("HideInventory",1000,false);
	return 1;
}

CMD:vehicle(playerid, params[])
{
	SendClientMessage(playerid, COLOR_CYAN, "PROPER USAGE: "COL_WHITE"/(v)ehicle");
	ShowVehicleOptions(playerid);
	return 1;
}

CMD:v(playerid, params[])
{
	ShowVehicleOptions(playerid);
	return 1;
}





forward HideInventory();

public HideInventory(){
	PlayerTextDrawHide(0, PlayerText:Slot0[0]);
    PlayerTextDrawHide(0, PlayerText:Slot1[0]);
    PlayerTextDrawHide(0, PlayerText:Slot2[0]);
	return 1;
}


// Menu



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

DisplayBars(playerid)
{
    pEXPBarID[playerid] = CreatePlayerProgressBar(playerid, 20.0, 435.0, 100.0, 8.0, 0x4dffffFF, PlayerInfo[playerid][pMaxEXPBarValue], BAR_DIRECTION_RIGHT);
    SetPlayerProgressBarValue(playerid, pEXPBarID[playerid], PlayerInfo[playerid][pEXP]);
    ShowPlayerProgressBar(playerid, pEXPBarID[playerid]);
    
	return 1;

}

DisplayEXP(playerid)
{

    expstat[playerid] = CreatePlayerTextDraw(playerid, 123.999969, 433.813385, "XP (0/4)");
	PlayerTextDrawLetterSize(playerid, expstat[playerid], 0.300000, 1.000000);
	PlayerTextDrawAlignment(playerid, expstat[playerid], 1);
	PlayerTextDrawColor(playerid, expstat[playerid], -1);
	PlayerTextDrawSetShadow(playerid, expstat[playerid], 0);
	PlayerTextDrawSetOutline(playerid, expstat[playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, expstat[playerid], 51);
	PlayerTextDrawFont(playerid, expstat[playerid], 1);
	PlayerTextDrawSetProportional(playerid, expstat[playerid], 1);
	PlayerTextDrawShow(playerid, PlayerText:expstat[playerid]);
	
	new string[129];
	format(string, sizeof(string), "XP (%d/%d)", PlayerInfo[playerid][pEXP], PlayerInfo[playerid][pMaxEXP]);
	PlayerTextDrawSetString(playerid, PlayerText:expstat[playerid], string);
	
	return 1;

}

DisplayLevel(playerid)
{

	levelstat[playerid] = CreatePlayerTextDraw(playerid, 133.600021, 409.919982, "Level: 1");
	PlayerTextDrawLetterSize(playerid, levelstat[playerid], 0.300000, 1.000000);
	PlayerTextDrawAlignment(playerid, levelstat[playerid], 1);
	PlayerTextDrawColor(playerid, levelstat[playerid], 16777215);
	PlayerTextDrawSetShadow(playerid, levelstat[playerid], 0);
	PlayerTextDrawSetOutline(playerid, levelstat[playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, levelstat[playerid], 51);
	PlayerTextDrawFont(playerid, levelstat[playerid], 1);
	PlayerTextDrawSetProportional(playerid, levelstat[playerid], 1);
	PlayerTextDrawShow(playerid, PlayerText:levelstat[playerid]);

	return 1;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{

    new string[128];
    format(string, sizeof(string), "[Character] You are entering vehicle {FFFFFF}ID:%i.{FFFFFF}", vehicleid);
	SendClientMessage(playerid, COLOR_CYAN, string);

    return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	
    new string[135];
    format(string, sizeof(string), "[Character] You are exiting vehicle {FFFFFF}ID:%i.{FFFFFF}", vehicleid);
    SendClientMessage(playerid, COLOR_CYAN, string);
    return 1;
}


ShowVehicleOptions(playerid)
{
    new vehicleid;
	vehicleid=GetPlayerVehicleID(playerid);
	if(vehicleid == 0)
	{
	    SendClientMessage(playerid, COLOR_CYAN, "ERROR: You are {FFFFFF}not{FFFFFF} in a vehicle.");
	}
	else
	{
	    new string[129], eng, lig, ala, door, bonnet, trunk, obj, Float:condition;
	    new engine[129], light[129], alarm[129], doorid[129], bonnetid[129], trunkid[129];
	    GetVehicleParamsEx(vehicleid, eng, lig, ala, door, bonnet, trunk, obj);
        GetVehicleHealth(vehicleid, condition);
	    if(eng==1)
	    {
	        format(engine, sizeof(engine), "Running");
	    }
	    else
	    {
	        format(engine,sizeof(engine), "Off");
	    }

        if(lig==1)
	    {
	        format(light, sizeof(light), "On");
	    }
	    else
	    {
	        format(light,sizeof(light), "Off");
	    }

        if(ala==1)
	    {
	        format(alarm, sizeof(alarm), "On");
	    }
	    else
	    {
	        format(alarm,sizeof(alarm), "Off");
	    }

        if(door==1)
	    {
	        format(doorid, sizeof(doorid), "Locked");
	    }
	    else
	    {
	        format(doorid,sizeof(doorid), "Unlocked");
	    }

        if(bonnet==1)
	    {
	        format(bonnetid, sizeof(bonnetid), "Open");
	    }
	    else
	    {
	        format(bonnetid,sizeof(bonnetid), "Closed");
	    }

	    if(trunk==1)
	    {
	        format(trunkid, sizeof(trunkid), "Open");
	    }
	    else
	    {
	        format(trunkid,sizeof(trunkid), "Closed");
	    }


	    format(string, sizeof(string), "Engine (%s)\nLights (%s)\nAlarm (%s)\nDoor (%s)\nBonnet (%s)\nTrunk (%s)\nCondition (%f)\nGas", engine, light, alarm, doorid, bonnetid, trunkid, condition);
	    ShowPlayerDialog(playerid, VEHICLE_MENU_ONE, DIALOG_STYLE_LIST, "Vehicle Options", string, "Confirm", "Cancel");

	}
	return 1;
}

ShowPlayerSkills(playerid)
{
   	new string[129];
	format(string, sizeof(string), ""COL_INDIGO"\t\t***General Skills***\n"COL_GREEN"\t\t***Human Skills***\n"COL_MAROON"\t\t***Vampire Skills***\nVampireJump(%d/3)", PlayerInfo[playerid][pVampireJump]);
	ShowPlayerDialog(playerid, SKILL_DIALOG, DIALOG_STYLE_LIST, "Skills", string, "Select", "Cancel");
}
