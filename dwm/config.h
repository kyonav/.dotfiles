/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int gappx     = 5;        /* gaps between windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const unsigned int systraypinning = 0;   /* 0: sloppy systray follows selected monitor, >0: pin systray to monitor X */
static const unsigned int systrayonleft  = 1;   /* 0: systray in the right corner, >0: systray on left of status text */
static const unsigned int systrayspacing = 4;   /* systray spacing */
static const int systraypinningfailfirst = 1;   /* 1: if pinning fails, display systray on the first monitor, False: display systray on the last monitor*/
static const int showsystray        = 1;        /* 0 means no systray */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = { "UbuntuMonoNerdFont-Regular:size=12", "fa-regular-400:size=8", "fa-brands-400" };
static const char dmenufont[]       = "UbuntuMonoNerdFont-Regular:size=12";

static const char *const autostart[] = { // cool-autostart patch 
	"sh", "-c", "$XDG_CONFIG_HOME/dwm/scripts/autostart.sh", NULL, /* runs autostart.sh on boot */
	NULL /* terminate */
};

/* dwm colors */
#include "/home/9ROT7XX/.cache/wal/colors-wal-dwm.h" // custom colors

/* tagging */
static const char *tags[] = { "  ~", "", " ", "", " ", "", "", " ", " " };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Gimp",     NULL,       NULL,       0,            1,           -1 },
	{ "Firefox",  NULL,       NULL,       1 << 8,       0,           -1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod1Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static const char *dmenucmd[] = {"dmenu_run", NULL};
static const char *termcmd[]  = { "st", NULL };

#include "shiftview.c" /* switch between dekstops prev/next desktop */
static const Key keys[] = {
    /* modifier             key     function        argument */
	{ MODKEY,               46,     spawn,          {.v = dmenucmd } }, // l
	{ MODKEY,               36,     spawn,          {.v = termcmd } }, // Return
	{ MODKEY,               53,     togglebar,      {0} },          // x
	{ MODKEY,               43,     focusstack,     {.i = +1 } },   // h
	{ MODKEY,               28,     focusstack,     {.i = -1 } },   // t
//	{ MODKEY,               31,     incnmaster,     {.i = +1 } },   // ?
//	{ MODKEY,               40,     incnmaster,     {.i = -1 } },   // ?
	{ MODKEY,               40,     setmfact,       {.f = -0.05} }, // d?
	{ MODKEY,               44,     setmfact,       {.f = +0.05} }, // j?
	{ MODKEY,               36,     zoom,           {0} },          // Return
	{ MODKEY,               23,     view,           {0} },          // Tab
	{ MODKEY|ShiftMask,     54,     killclient,     {0} },          // c
	{ MODKEY,               25,     setlayout,      {.v = &layouts[0]} }, // w
	{ MODKEY,               55,     setlayout,      {.v = &layouts[1]} }, // v
	{ MODKEY,               52,     setlayout,      {.v = &layouts[2]} }, // z
	{ MODKEY,               65,     setlayout,      {0} },          // space 
    { MODKEY|ShiftMask,     65,     togglefloating, {0} },          // space
	{ MODKEY,               19,     view,           {.ui = ~0 } },  // 0
	{ MODKEY|ShiftMask,     19,     tag,            {.ui = ~0 } },  // 0
//	{ MODKEY,               59,     focusmon,       {.i = -1 } },   // comma
//  { MODKEY,               60,     focusmon,       {.i = +1 } },   // period
//  { MODKEY|ShiftMask,     59,     tagmon,         {.i = -1 } },   // comma
//  { MODKEY|ShiftMask,     60,     tagmon,         {.i = +1 } },   // period
	TAGKEYS(                38,                     0)              // 
	TAGKEYS(                32,                     1)              // 
	TAGKEYS(                26,                     2)              // 
	TAGKEYS(                30,                     3)              // 
	TAGKEYS(                31,                     4)              // 
	TAGKEYS(                40,                     5)              // 
	TAGKEYS(                43,                     6)              // 
	TAGKEYS(                28,                     7)              // 
	TAGKEYS(                57,                     8)              // 
	{ MODKEY|ShiftMask,     24,     quit,           {0} },          // ;
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};
