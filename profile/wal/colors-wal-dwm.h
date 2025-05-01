static const char norm_fg[] = "#dde2df";
static const char norm_bg[] = "#0b0b0b";
static const char norm_border[] = "#9a9e9c";

static const char sel_fg[] = "#dde2df";
static const char sel_bg[] = "#FB0046";
static const char sel_border[] = "#dde2df";

//static const char urg_fg[] = "#dde2df";
//static const char urg_bg[] = "#D30843";
//static const char urg_border[] = "#D30843";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
//    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
