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

//Define Pressed Key
#define PRESSED(%0) \
	(((newkeys & (%0)) == (%0)) && ((oldkeys & (%0)) != (%0)))

//Color Defines
#define COLOR_MAROON 0x66000055
#define COLOR_INDIGO 0x6666ff55
#define COL_WHITE "{FFFFFF}"
#define COL_RED "{F81414}"
#define COL_GREEN "{00FF22}"
#define COL_LIGHTBLUE "{00CED1}"
#define COL_MAROON "{660000}"
#define COL_INDIGO "{6666ff}"

//Menu
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

new pEXPBarID[MAX_PLAYERS];

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
	pEXPBarValue,
	pItem1,
	pItem2,
	pItem3,
	pItem4,
	pItem5,
	pItem6,
	pItem7,
	pItem8,
	pItem9,
	pItem10,
	pItem11,
	pItem12,
	pItem13,
	pItem14,
	pItem15,
	pItem16,
	pItem17,
	pItem18,
	pItem19,
	pItem20
}
new PlayerInfo[MAX_PLAYERS][pInfo];

forward JumpDisable();

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
	INI_Int("pItem1", PlayerInfo[playerid][pItem1]);
	INI_Int("pItem2", PlayerInfo[playerid][pItem2]);
	INI_Int("pItem3", PlayerInfo[playerid][pItem3]);
	INI_Int("pItem4", PlayerInfo[playerid][pItem4]);
	INI_Int("pItem5", PlayerInfo[playerid][pItem5]);
	INI_Int("pItem6", PlayerInfo[playerid][pItem6]);
	INI_Int("pItem7", PlayerInfo[playerid][pItem7]);
	INI_Int("pItem8", PlayerInfo[playerid][pItem8]);
	INI_Int("pItem9", PlayerInfo[playerid][pItem9]);
	INI_Int("pItem10", PlayerInfo[playerid][pItem10]);
	INI_Int("pItem11", PlayerInfo[playerid][pItem11]);
	INI_Int("pItem12", PlayerInfo[playerid][pItem12]);
	INI_Int("pItem13", PlayerInfo[playerid][pItem13]);
	INI_Int("pItem14", PlayerInfo[playerid][pItem14]);
	INI_Int("pItem15", PlayerInfo[playerid][pItem15]);
	INI_Int("pItem16", PlayerInfo[playerid][pItem16]);
	INI_Int("pItem17", PlayerInfo[playerid][pItem17]);
    INI_Int("pItem18", PlayerInfo[playerid][pItem18]);
    INI_Int("pItem19", PlayerInfo[playerid][pItem19]);
    INI_Int("pItem20", PlayerInfo[playerid][pItem20]);
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
        DisplayCharacterItems(playerid);
        ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_INPUT,""COL_WHITE"Login",""COL_WHITE"Type your password below to login.","Login","Quit");
    }
    else
    {
        ShowPlayerDialog(playerid, DIALOG_REGISTER, DIALOG_STYLE_INPUT,""COL_WHITE"Register",""COL_WHITE"Type your password below to register a new account.","Register","Quit");
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
                if(!strlen(inputtext)) return ShowPlayerDialog(playerid, DIALOG_REGISTER, DIALOG_STYLE_INPUT, ""COL_WHITE"Register",""COL_RED"You have entered an invalid password.\n"COL_WHITE"Type your password below to register a new account.","Register","Quit");
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
				INI_WriteInt(File,"pItem1", 0);
				INI_WriteInt(File,"pItem2", 0);
				INI_WriteInt(File,"pItem3", 0);
				INI_WriteInt(File,"pItem4", 0);
				INI_WriteInt(File,"pItem5", 0);
				INI_WriteInt(File,"pItem6", 0);
				INI_WriteInt(File,"pItem7", 0);
				INI_WriteInt(File,"pItem8", 0);
				INI_WriteInt(File,"pItem9", 0);
				INI_WriteInt(File,"pItem10", 0);
				INI_WriteInt(File,"pItem11", 0);
				INI_WriteInt(File,"pItem12", 0);
				INI_WriteInt(File,"pItem13", 0);
				INI_WriteInt(File,"pItem14", 0);
				INI_WriteInt(File,"pItem15", 0);
				INI_WriteInt(File,"pItem16", 0);
				INI_WriteInt(File,"pItem17", 0);
			    INI_WriteInt(File,"pItem18", 0);
			    INI_WriteInt(File,"pItem19", 0);
			    INI_WriteInt(File,"pItem20", 0);
				INI_Close(File);

                SetSpawnInfo(playerid, 0, PlayerInfo[playerid][pSkin], 1958.33, 1343.12, 15.36, 269.15, 0, 0, 0, 0, 0, 0);
                SpawnPlayer(playerid);
                ShowPlayerDialog(playerid, DIALOG_SUCCESS_1, DIALOG_STYLE_MSGBOX,""COL_WHITE"Success!",""COL_GREEN"Relog to save your stats!","Ok","");
                
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
                    ShowPlayerDialog(playerid, DIALOG_SUCCESS_2, DIALOG_STYLE_MSGBOX,""COL_WHITE"Success!",""COL_GREEN"You have successfully logged in!","Ok","");
					SetSpawnInfo(playerid, 0, PlayerInfo[playerid][pSkin], PlayerInfo[playerid][pX], PlayerInfo[playerid][pY], PlayerInfo[playerid][pZ], PlayerInfo[playerid][pAngle], 0, 0, 0, 0, 0, 0);
                	SpawnPlayer(playerid);
                }
                else
                {
                    ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_INPUT,""COL_WHITE"Login",""COL_RED"You have entered an incorrect password.\n"COL_WHITE"Type your password below to login.","Login","Quit");
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
		case 1: ShowPlayerDialog(playerid, 60, DIALOG_STYLE_LIST, "{00C0FF}Commands", "Spawn NPC\nCash\nTeleportXYZ\nSetSkin", "Ok", "Cancel");
		case 2: ShowPlayerDialog(playerid, 52, DIALOG_STYLE_MSGBOX, "{00C0FF}Rules", "Ru 1 \nRule 2 \nRule 3", "Ok", "Cancel");
		case 3: ShowPlayerDialog(playerid, 53, DIALOG_STYLE_LIST, "{00C0FF}FireArm", "9mm \nSilenced 9mm\nDeagle\nShotgun\nSpawn-Off Shotgun\nSpas-12\nMac-9\nMP5\nAK47\nM4\nTec-9\nRifle\nSniper Rifle\nRPG\nHoming Rocket Launcher\nFlameThrower\nMinigun\nRemote C4\nRemote C4 Controller\nSpray Can\nFire Extinguisher\nCamera\nParachute", "Select", "Cancel");
        case 4: ShowPlayerDialog(playerid, 54, DIALOG_STYLE_LIST, "{00C0FF}Melee", "Brass Knuckles\nGolf Club\nNightStick\nKnife\nBaseball Bat\nShovel\nPool Cue\nKatana\nChainsaw\nPurple Dildo\nDildo\nVibrator\nSilver Vibrator\nFlowers\nCane\nGrenade\nTearGas\nMolotovCockTail", "Ok", "Cancel");
        case 5: ShowPlayerDialog(playerid, 55, DIALOG_STYLE_LIST, "{00C0FF}Race","Human\nVampire", "Select", "Cancel");
		}

	}
	if(dialogid == 60 && response == 1){
        
		switch(listitem)
		{
		case 0: SendClientMessage(playerid, -1, "You have spawned a Robot.");
		case 1: ShowPlayerDialog(playerid, 70, DIALOG_STYLE_INPUT, "Cash", "Target ID:", "Confirm", "Cancel");
		case 2: ShowPlayerDialog(playerid, 80, DIALOG_STYLE_INPUT, "Teleport","Enter X Coordinate:", "Confirm", "Cancel" );
		case 3: ShowPlayerDialog(playerid, 90, DIALOG_STYLE_INPUT, "SetSkin", "Enter Target ID:", "Confirm", "Cancel");
		}
	}
	
	if(dialogid == 90 && response == 1) {
		Assign[temp01]=strval(inputtext);
	    ShowPlayerDialog(playerid, 91, DIALOG_STYLE_INPUT, "SetSkin", "Enter Skin ID:", "Confirm", "Cancel");
	}
	
	if(dialogid == 91 && response == 1) {
	    Assign[temp02]=strval(inputtext);
		SetPlayerSkin(Assign[temp01], Assign[temp02]);
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
		
		} else if(listitem==1) {
		    PlayerInfo[playerid][pRace] = 1;
		    PlayerInfo[playerid][pVampireJump]=0;
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
	
	if(dialogid == SKILL_DIALOG)
	{
	    switch(listitem)
	    {
			case 0: PlayerInfo[playerid][pVampireJump]=1;
	    }
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
   	INI_WriteInt(File,"pItem1", PlayerInfo[playerid][pItem1]);
	INI_WriteInt(File,"pItem2", PlayerInfo[playerid][pItem2]);
	INI_WriteInt(File,"pItem3", PlayerInfo[playerid][pItem3]);
	INI_WriteInt(File,"pItem4", PlayerInfo[playerid][pItem4]);
	INI_WriteInt(File,"pItem5", PlayerInfo[playerid][pItem5]);
	INI_WriteInt(File,"pItem6", PlayerInfo[playerid][pItem6]);
	INI_WriteInt(File,"pItem7", PlayerInfo[playerid][pItem7]);
	INI_WriteInt(File,"pItem8", PlayerInfo[playerid][pItem8]);
	INI_WriteInt(File,"pItem9", PlayerInfo[playerid][pItem9]);
	INI_WriteInt(File,"pItem10", PlayerInfo[playerid][pItem10]);
	INI_WriteInt(File,"pItem11", PlayerInfo[playerid][pItem11]);
	INI_WriteInt(File,"pItem12", PlayerInfo[playerid][pItem12]);
	INI_WriteInt(File,"pItem13", PlayerInfo[playerid][pItem13]);
	INI_WriteInt(File,"pItem14", PlayerInfo[playerid][pItem14]);
	INI_WriteInt(File,"pItem15", PlayerInfo[playerid][pItem15]);
	INI_WriteInt(File,"pItem16", PlayerInfo[playerid][pItem16]);
	INI_WriteInt(File,"pItem17", PlayerInfo[playerid][pItem17]);
 	INI_WriteInt(File,"pItem18", PlayerInfo[playerid][pItem18]);
  	INI_WriteInt(File,"pItem19", PlayerInfo[playerid][pItem19]);
   	INI_WriteInt(File,"pItem20", PlayerInfo[playerid][pItem20]);




	INI_Close(File);
    return 1;
}

public OnPlayerSpawn(playerid)
{
	Assign[temp07]=0;
	DisplayBars(playerid);
	DisplayBottomMenu(playerid);
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
		SetTimer("JumpDisable", 10000, false);
 	}

	return 1;
}


public JumpDisable(){
	Assign[temp07]=0;
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
	ShowPlayerDialog(playerid, 50, DIALOG_STYLE_LIST, "AdminCMD", "Rules\nCommands\nJobs\nFireArms\nMelee\nRace", "Select", "Cancel");

	return 1;
}
CMD:skills(playerid, params[])
{
	ShowPlayerDialog(playerid, SKILL_DIALOG, DIALOG_STYLE_LIST, "Skills", "VampireJump(0/3)", "Select", "Cancel");
	return 1;
}

CMD:getbook(playerid, params[])
{
	printf(params);
	new a;
	sscanf(params, "%d", a);
	ManageItem(playerid, a, 1);
	return 1;
}
CMD:moveitem(playerid, params[])
{
	new itemslot, itemslot2;
	sscanf(params,"%d,%d", itemslot, itemslot2);
	printf("%d",itemslot);
	ManageItem(playerid, itemslot, 0);
	ManageItem(playerid, itemslot2, ReturnItemValue(playerid, itemslot));
	return 1;
}

CMD:removeitem(playerid, params[])
{
	new itemslot;
	sscanf(params, "%d", itemslot);
	ManageItem(playerid, itemslot, 0);
	SendClientMessage(playerid, -1, "[Character] You have dropped an item.");
	return 1;
	
}


ManageItem(playerid, itemnumber, valueofitem){
    new string[129];
    if(valueofitem==1){
		strcpy(string, "Book of Knowledge", sizeof(string));
	} else if(valueofitem==0){
	    strcpy(string, "Empty", sizeof(string));
	}
    ChangeItem(playerid, itemnumber, valueofitem);
	UpdateItem(playerid, itemnumber, string);
	return 1;
}

ReturnItemValue(playerid, itemnumber){
	if(itemnumber==1){
	    return PlayerInfo[playerid][pItem1];
	}
	if(itemnumber==2){
	    return PlayerInfo[playerid][pItem2];
	}
	if(itemnumber==3){
	    return PlayerInfo[playerid][pItem3];
	}
	if(itemnumber==4){
	    return PlayerInfo[playerid][pItem4];
	}
	if(itemnumber==5){
    	return PlayerInfo[playerid][pItem5];
	}
    if(itemnumber==6){
	    return PlayerInfo[playerid][pItem6];
	}
	if(itemnumber==7){
	    return PlayerInfo[playerid][pItem7];
	}
	if(itemnumber==8){
	    return PlayerInfo[playerid][pItem8];
	}
    if(itemnumber==9){
	    return PlayerInfo[playerid][pItem9];
	}
	if(itemnumber==10){
	    return PlayerInfo[playerid][pItem10];
	}
    if(itemnumber==11){
	    return PlayerInfo[playerid][pItem11];
	}
    if(itemnumber==12){
	    return PlayerInfo[playerid][pItem12];
	}
    if(itemnumber==13){
	    return PlayerInfo[playerid][pItem13];
	}
	if(itemnumber==14){
	    return PlayerInfo[playerid][pItem14];
	}
	if(itemnumber==15){
	    return PlayerInfo[playerid][pItem15];
	}
    if(itemnumber==16){
	    return PlayerInfo[playerid][pItem16];
	}
    if(itemnumber==17){
	    return PlayerInfo[playerid][pItem17];
	}
    if(itemnumber==18){
	    return PlayerInfo[playerid][pItem18];
	}
    if(itemnumber==19){
	    return PlayerInfo[playerid][pItem19];
	}
    if(itemnumber==20){
	    return PlayerInfo[playerid][pItem20];
	}


	return 1;
}


ChangeItem(playerid, itemnumber, change){
	if(itemnumber==1){
	    PlayerInfo[playerid][pItem1]=change;
	}
	if(itemnumber==2){
	    PlayerInfo[playerid][pItem2]=change;
	}
	if(itemnumber==3){
	    PlayerInfo[playerid][pItem3]=change;
	}
	if(itemnumber==4){
	    PlayerInfo[playerid][pItem4]=change;
	}
	if(itemnumber==5){
    	PlayerInfo[playerid][pItem5]=change;
	}
    if(itemnumber==6){
	    PlayerInfo[playerid][pItem6]=change;
	}
	if(itemnumber==7){
	    PlayerInfo[playerid][pItem7]=change;
	}
	if(itemnumber==8){
	    PlayerInfo[playerid][pItem8]=change;
	}
    if(itemnumber==9){
	    PlayerInfo[playerid][pItem9]=change;
	}
	if(itemnumber==10){
	    PlayerInfo[playerid][pItem10]=change;
	}
    if(itemnumber==11){
	    PlayerInfo[playerid][pItem11]=change;
	}
    if(itemnumber==12){
	    PlayerInfo[playerid][pItem12]=change;
	}
    if(itemnumber==13){
	    PlayerInfo[playerid][pItem13]=change;
	}
	if(itemnumber==14){
	    PlayerInfo[playerid][pItem14]=change;
	}
	if(itemnumber==15){
	    PlayerInfo[playerid][pItem15]=change;
	}
    if(itemnumber==16){
	    PlayerInfo[playerid][pItem16]=change;
	}
    if(itemnumber==17){
	    PlayerInfo[playerid][pItem17]=change;
	}
    if(itemnumber==18){
	    PlayerInfo[playerid][pItem18]=change;
	}
    if(itemnumber==19){
	    PlayerInfo[playerid][pItem19]=change;
	}
    if(itemnumber==20){
	    PlayerInfo[playerid][pItem20]=change;
	}
	

	return 1;
}

UpdateItem(playerid, itemslot, string[]){

	if(itemslot==1){
		PlayerTextDrawSetString(playerid, PlayerText:EmptyOne[playerid], string);
	} else if(itemslot==2) {
		PlayerTextDrawSetString(playerid, PlayerText:EmptyTwo[playerid], string);
	} else if(itemslot==3) {
	    PlayerTextDrawSetString(playerid, PlayerText:EmptyThird[playerid], string);
	} else if(itemslot==4) {
	    PlayerTextDrawSetString(playerid, PlayerText:EmptyFour[playerid], string);
 	} else if(itemslot==5) {
	    PlayerTextDrawSetString(playerid, PlayerText:EmptyFive[playerid], string);
    } else if(itemslot==6) {
	    PlayerTextDrawSetString(playerid, PlayerText:EmptySix[playerid], string);
    } else if(itemslot==7) {
	    PlayerTextDrawSetString(playerid, PlayerText:EmptySeven[playerid], string);
    } else if(itemslot==8) {
	    PlayerTextDrawSetString(playerid, PlayerText:EmptyEight[playerid], string);
    } else if(itemslot==9) {
	    PlayerTextDrawSetString(playerid, PlayerText:EmptyNine[playerid], string);
    } else if(itemslot==10) {
	    PlayerTextDrawSetString(playerid, PlayerText:EmptyTen[playerid], string);
    } else if(itemslot==11) {
	    PlayerTextDrawSetString(playerid, PlayerText:EmptyEleven[playerid], string);
    } else if(itemslot==12) {
	    PlayerTextDrawSetString(playerid, PlayerText:EmptyTwelve[playerid], string);
    } else if(itemslot==13) {
	    PlayerTextDrawSetString(playerid, PlayerText:EmptyThirdteen[playerid], string);
    } else if(itemslot==14) {
	    PlayerTextDrawSetString(playerid, PlayerText:EmptyFourteen[playerid], string);
    } else if(itemslot==15) {
	    PlayerTextDrawSetString(playerid, PlayerText:EmptyFifthteen[playerid], string);
    } else if(itemslot==16) {
	    PlayerTextDrawSetString(playerid, PlayerText:EmptySixteen[playerid], string);
    } else if(itemslot==17) {
	    PlayerTextDrawSetString(playerid, PlayerText:EmptySeventeen[playerid], string);
    } else if(itemslot==18) {
	    PlayerTextDrawSetString(playerid, PlayerText:EmptyEighteen[playerid], string);
    } else if(itemslot==19) {
	    PlayerTextDrawSetString(playerid, PlayerText:EmptyNineteen[playerid], string);
    } else if(itemslot==20) {
	    PlayerTextDrawSetString(playerid, PlayerText:EmptyTwenty[playerid], string);
	}
	return 1;
}


// Menu

DisplayCharacterItems(playerid) {

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
    pEXPBarID[playerid] = CreatePlayerProgressBar(playerid, 20.0, 430.0, 100.0, 8.0, 0xcfcaf1FF, 10.0, BAR_DIRECTION_RIGHT);
    SetPlayerProgressBarValue(0, pEXPBarID[playerid], 0.0);
    ShowPlayerProgressBar(0, pEXPBarID[playerid]);
}




