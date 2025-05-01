const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#0b0b0b", /* black   */
  [1] = "#D30843", /* red     */
  [2] = "#FB0046", /* green   */
  [3] = "#738975", /* yellow  */
  [4] = "#809381", /* blue    */
  [5] = "#99A99B", /* magenta */
  [6] = "#B8C7BB", /* cyan    */
  [7] = "#dde2df", /* white   */

  /* 8 bright colors */
  [8]  = "#9a9e9c",  /* black   */
  [9]  = "#D30843",  /* red     */
  [10] = "#FB0046", /* green   */
  [11] = "#738975", /* yellow  */
  [12] = "#809381", /* blue    */
  [13] = "#99A99B", /* magenta */
  [14] = "#B8C7BB", /* cyan    */
  [15] = "#dde2df", /* white   */

  /* special colors */
  [256] = "#0b0b0b", /* background */
  [257] = "#dde2df", /* foreground */
  [258] = "#dde2df",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
