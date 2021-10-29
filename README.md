
<!-- README.md is generated from README.Rmd. Please edit that file -->

# datardis

<!-- badges: start -->
<!-- badges: end -->

The goal of datardis is to provide datasets from the Doctor Who TV
series.

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("KittJonathan/datardis")
```

## Example

Load list of episodes:

``` r
## Load packages
library(datardis)
library(magrittr)

## Load dataset
episodes
#>         era season_number serial_title story_number episode_number
#> 1   revived             1           NA          157              1
#> 2   revived             1           NA          158              2
#> 3   revived             1           NA          159              3
#> 4   revived             1           NA         160a              4
#> 5   revived             1           NA         160b              5
#> 6   revived             1           NA          161              6
#> 7   revived             1           NA          162              7
#> 8   revived             1           NA          163              8
#> 9   revived             1           NA         164a              9
#> 10  revived             1           NA         164b             10
#> 11  revived             1           NA          165             11
#> 12  revived             1           NA         166a             12
#> 13  revived             1           NA         166b             13
#> 14  revived             2           NA          167             NA
#> 15  revived             2           NA          168              1
#> 16  revived             2           NA          169              2
#> 17  revived             2           NA          170              3
#> 18  revived             2           NA          171              4
#> 19  revived             2           NA         172a              5
#> 20  revived             2           NA         172b              6
#> 21  revived             2           NA          173              7
#> 22  revived             2           NA         174a              8
#> 23  revived             2           NA         174b              9
#> 24  revived             2           NA          175             10
#> 25  revived             2           NA          176             11
#> 26  revived             2           NA         177a             12
#> 27  revived             2           NA         177b             13
#> 28  revived             3           NA          178             NA
#> 29  revived             3           NA          179              1
#> 30  revived             3           NA          180              2
#> 31  revived             3           NA          181              3
#> 32  revived             3           NA         182a              4
#> 33  revived             3           NA         182b              5
#> 34  revived             3           NA          183              6
#> 35  revived             3           NA          184              7
#> 36  revived             3           NA         185a              8
#> 37  revived             3           NA         185b              9
#> 38  revived             3           NA          186             10
#> 39  revived             3           NA         187a             11
#> 40  revived             3           NA         187b             12
#> 41  revived             3           NA         187c             13
#> 42  revived             4           NA          188             NA
#> 43  revived             4           NA          189              1
#> 44  revived             4           NA          190              2
#> 45  revived             4           NA          191              3
#> 46  revived             4           NA         192a              4
#> 47  revived             4           NA         192b              5
#> 48  revived             4           NA          193              6
#> 49  revived             4           NA          194              7
#> 50  revived             4           NA         195a              8
#> 51  revived             4           NA         195b              9
#> 52  revived             4           NA          196             10
#> 53  revived             4           NA          197             11
#> 54  revived             4           NA         198a             12
#> 55  revived             4           NA         198b             13
#> 56  revived            NA           NA          199             NA
#> 57  revived            NA           NA          200             NA
#> 58  revived            NA           NA          201             NA
#> 59  revived            NA           NA         202a             NA
#> 60  revived            NA           NA         202b             NA
#> 61  revived             5           NA          203              1
#> 62  revived             5           NA          204              2
#> 63  revived             5           NA          205              3
#> 64  revived             5           NA         206a              4
#> 65  revived             5           NA         206b              5
#> 66  revived             5           NA          207              6
#> 67  revived             5           NA          208              7
#> 68  revived             5           NA         209a              8
#> 69  revived             5           NA         209b              9
#> 70  revived             5           NA          210             10
#> 71  revived             5           NA          211             11
#> 72  revived             5           NA         212a             12
#> 73  revived             5           NA         212b             13
#> 74  revived             6           NA          213             NA
#> 75  revived             6           NA         214a              1
#> 76  revived             6           NA         214b              2
#> 77  revived             6           NA          215              3
#> 78  revived             6           NA          216              4
#> 79  revived             6           NA         217a              5
#> 80  revived             6           NA         217b              6
#> 81  revived             6           NA          218              7
#> 82  revived             6           NA          219              8
#> 83  revived             6           NA          220              9
#> 84  revived             6           NA          221             10
#> 85  revived             6           NA          222             11
#> 86  revived             6           NA          223             12
#> 87  revived             6           NA          224             13
#> 88  revived             7           NA          225             NA
#> 89  revived             7           NA          226              1
#> 90  revived             7           NA          227              2
#> 91  revived             7           NA          228              3
#> 92  revived             7           NA          229              4
#> 93  revived             7           NA          230              5
#> 94  revived             7           NA          231             NA
#> 95  revived             7           NA          232              6
#> 96  revived             7           NA          233              7
#> 97  revived             7           NA          234              8
#> 98  revived             7           NA          235              9
#> 99  revived             7           NA          236             10
#> 100 revived             7           NA          237             11
#> 101 revived             7           NA          238             12
#> 102 revived             7           NA          239             13
#> 103 revived            NA           NA          240             NA
#> 104 revived            NA           NA          241             NA
#> 105 revived             8           NA          242              1
#> 106 revived             8           NA          243              2
#> 107 revived             8           NA          244              3
#> 108 revived             8           NA          245              4
#> 109 revived             8           NA          246              5
#> 110 revived             8           NA          247              6
#> 111 revived             8           NA          248              7
#> 112 revived             8           NA          249              8
#> 113 revived             8           NA          250              9
#> 114 revived             8           NA          251             10
#> 115 revived             8           NA         252a             11
#> 116 revived             8           NA         252b             12
#> 117 revived             9           NA          253             NA
#> 118 revived             9           NA         254a              1
#> 119 revived             9           NA         254b              2
#> 120 revived             9           NA         255a              3
#> 121 revived             9           NA         255b              4
#> 122 revived             9           NA          256              5
#> 123 revived             9           NA          257              6
#> 124 revived             9           NA         258a              7
#> 125 revived             9           NA         258b              8
#> 126 revived             9           NA          259              9
#> 127 revived             9           NA          260             10
#> 128 revived             9           NA          261             11
#> 129 revived             9           NA          262             12
#> 130 revived             9           NA          263             NA
#> 131 revived            10           NA          264             NA
#> 132 revived            10           NA          265              1
#> 133 revived            10           NA          266              2
#> 134 revived            10           NA          267              3
#> 135 revived            10           NA          268              4
#> 136 revived            10           NA          269              5
#> 137 revived            10           NA          270              6
#> 138 revived            10           NA          271              7
#> 139 revived            10           NA          272              8
#> 140 revived            10           NA          273              9
#> 141 revived            10           NA          274             10
#> 142 revived            10           NA         275a             11
#> 143 revived            10           NA         275b             12
#> 144 revived            10           NA          276             NA
#> 145 revived            11           NA          277              1
#> 146 revived            11           NA          278              2
#> 147 revived            11           NA          279              3
#> 148 revived            11           NA          280              4
#> 149 revived            11           NA          281              5
#> 150 revived            11           NA          282              6
#> 151 revived            11           NA          283              7
#> 152 revived            11           NA          284              8
#> 153 revived            11           NA          285              9
#> 154 revived            11           NA          286             10
#> 155 revived            11           NA          287             NA
#> 156 revived            12           NA         288a              1
#> 157 revived            12           NA         288b              2
#> 158 revived            12           NA          289              3
#> 159 revived            12           NA          290              4
#> 160 revived            12           NA          291              5
#> 161 revived            12           NA          292              6
#> 162 revived            12           NA          293              7
#> 163 revived            12           NA          294              8
#> 164 revived            12           NA         295a              9
#> 165 revived            12           NA         295b             10
#> 166 revived            12           NA          296             NA
#>                                      title    type           director
#> 1                                     Rose episode         Keith Boak
#> 2                     The End of the World episode          Euros Lyn
#> 3                         The Unquiet Dead episode          Euros Lyn
#> 4                         Aliens of London episode         Keith Boak
#> 5                          World War Three episode         Keith Boak
#> 6                                    Dalek episode        Joe Ahearne
#> 7                            The Long Game episode        Brian Grant
#> 8                             Father's Day episode        Joe Ahearne
#> 9                          The Empty Child episode        James Hawes
#> 10                       The Doctor Dances episode        James Hawes
#> 11                               Boom Town episode        Joe Ahearne
#> 12                                Bad Wolf episode        Joe Ahearne
#> 13                 The Parting of the Ways episode        Joe Ahearne
#> 14                  The Christmas Invasion special        James Hawes
#> 15                               New Earth episode        James Hawes
#> 16                          Tooth and Claw episode          Euros Lyn
#> 17                          School Reunion episode        James Hawes
#> 18               The Girl in the Fireplace episode          Euros Lyn
#> 19                    Rise of the Cybermen episode      Graeme Harper
#> 20                        The Age of Steel episode      Graeme Harper
#> 21                     The Idiot's Lantern episode          Euros Lyn
#> 22                   The Impossible Planet episode       James Strong
#> 23                           The Satan Pit episode       James Strong
#> 24                         Love & Monsters episode           Dan Zeff
#> 25                                Fear Her episode          Euros Lyn
#> 26                          Army of Ghosts episode      Graeme Harper
#> 27                                Doomsday episode      Graeme Harper
#> 28                       The Runaway Bride special          Euros Lyn
#> 29                         Smith and Jones episode     Charles Palmer
#> 30                    The Shakespeare Code episode     Charles Palmer
#> 31                                Gridlock episode      Richard Clark
#> 32                     Daleks in Manhattan episode       James Strong
#> 33                 Evolution of the Daleks episode       James Strong
#> 34                  The Lazarus Experiment episode      Richard Clark
#> 35                                      42 episode      Graeme Harper
#> 36                            Human Nature episode     Charles Palmer
#> 37                     The Family of Blood episode     Charles Palmer
#> 38                                   Blink episode   Hettie MacDonald
#> 39                                  Utopia episode      Graeme Harper
#> 40                      The Sound of Drums episode       Colin Teague
#> 41                  Last of the Time Lords episode       Colin Teague
#> 42                    Voyage of the Damned special       James Strong
#> 43                       Partners in Crime episode       James Strong
#> 44                    The Fires of Pompeii episode       Colin Teague
#> 45                       Planet of the Ood episode      Graeme Harper
#> 46                  The Sontaran Stratagem episode  Douglas Mackinnon
#> 47                          The Poison Sky episode  Douglas Mackinnon
#> 48                   The Doctor's Daughter episode    Alice Troughton
#> 49                The Unicorn and the Wasp episode      Graeme Harper
#> 50                  Silence in the Library episode          Euros Lyn
#> 51                      Forest of the Dead episode          Euros Lyn
#> 52                                Midnight episode    Alice Troughton
#> 53                               Turn Left episode      Graeme Harper
#> 54                        The Stolen Earth episode      Graeme Harper
#> 55                           Journey's End episode      Graeme Harper
#> 56                         The Next Doctor special       Andy Goddard
#> 57                      Planet of the Dead special       James Strong
#> 58                      The Waters of Mars special      Graeme Harper
#> 59              The End of Time – Part One special          Euros Lyn
#> 60              The End of Time – Part Two special          Euros Lyn
#> 61                       The Eleventh Hour episode         Adam Smith
#> 62                         The Beast Below episode        Andrew Gunn
#> 63                   Victory of the Daleks episode        Andrew Gunn
#> 64                      The Time of Angels episode         Adam Smith
#> 65                         Flesh and Stone episode         Adam Smith
#> 66                  The Vampires of Venice episode     Jonny Campbell
#> 67                            Amy's Choice episode Catherine Morshead
#> 68                        The Hungry Earth episode         Ashley Way
#> 69                              Cold Blood episode         Ashley Way
#> 70                  Vincent and the Doctor episode     Jonny Campbell
#> 71                              The Lodger episode Catherine Morshead
#> 72                     The Pandorica Opens episode        Toby Haynes
#> 73                            The Big Bang episode        Toby Haynes
#> 74                       A Christmas Carol special        Toby Haynes
#> 75                The Impossible Astronaut episode        Toby Haynes
#> 76                         Day of the Moon episode        Toby Haynes
#> 77             The Curse of the Black Spot episode        Jeremy Webb
#> 78                       The Doctor's Wife episode      Richard Clark
#> 79                         The Rebel Flesh episode     Julian Simpson
#> 80                       The Almost People episode     Julian Simpson
#> 81                  A Good Man Goes to War episode         Peter Hoar
#> 82                       Let's Kill Hitler episode     Richard Senior
#> 83                           Night Terrors episode      Richard Clark
#> 84                     The Girl Who Waited episode        Nick Hurran
#> 85                         The God Complex episode        Nick Hurran
#> 86                            Closing Time episode       Steve Hughes
#> 87               The Wedding of River Song episode        Jeremy Webb
#> 88  The Doctor, the Widow and the Wardrobe special   Farren Blackburn
#> 89                    Asylum of the Daleks episode        Nick Hurran
#> 90                Dinosaurs on a Spaceship episode     Saul Metzstein
#> 91                     A Town Called Mercy episode     Saul Metzstein
#> 92                      The Power of Three episode  Douglas Mackinnon
#> 93               The Angels Take Manhattan episode        Nick Hurran
#> 94                             The Snowmen special     Saul Metzstein
#> 95                 The Bells of Saint John episode      Colm McCarthy
#> 96                    The Rings of Akhaten episode   Farren Blackburn
#> 97                                Cold War episode  Douglas Mackinnon
#> 98                                    Hide episode        Jamie Payne
#> 99     Journey to the Centre of the TARDIS episode           Mat King
#> 100                     The Crimson Horror episode     Saul Metzstein
#> 101                    Nightmare in Silver episode Stephen Woolfenden
#> 102                 The Name of the Doctor episode     Saul Metzstein
#> 103                  The Day of the Doctor special        Nick Hurran
#> 104                 The Time of the Doctor special        Jamie Payne
#> 105                            Deep Breath episode       Ben Wheatley
#> 106                         Into the Dalek episode       Ben Wheatley
#> 107                      Robot of Sherwood episode        Paul Murphy
#> 108                                 Listen episode  Douglas Mackinnon
#> 109                             Time Heist episode  Douglas Mackinnon
#> 110                          The Caretaker episode        Paul Murphy
#> 111                          Kill the Moon episode    Paul Wilmshurst
#> 112            Mummy on the Orient Express episode    Paul Wilmshurst
#> 113                               Flatline episode  Douglas Mackinnon
#> 114             In the Forest of the Night episode     Sheree Folkson
#> 115                             Dark Water episode     Rachel Talalay
#> 116                        Death in Heaven episode     Rachel Talalay
#> 117                         Last Christmas special    Paul Wilmshurst
#> 118              The Magician's Apprentice episode   Hettie MacDonald
#> 119                   The Witch's Familiar episode   Hettie MacDonald
#> 120                         Under the Lake episode      Daniel O'Hara
#> 121                       Before the Flood episode      Daniel O'Hara
#> 122                      The Girl Who Died episode      Ed Bazalgette
#> 123                    The Woman Who Lived episode      Ed Bazalgette
#> 124                     The Zygon Invasion episode    Daniel Nettheim
#> 125                    The Zygon Inversion episode    Daniel Nettheim
#> 126                          Sleep No More episode  Justin Molotnikov
#> 127                         Face the Raven episode  Justin Molotnikov
#> 128                            Heaven Sent episode     Rachel Talalay
#> 129                              Hell Bent episode     Rachel Talalay
#> 130             The Husbands of River Song special  Douglas Mackinnon
#> 131          The Return of Doctor Mysterio special      Ed Bazalgette
#> 132                              The Pilot episode     Lawrence Gough
#> 133                                  Smile episode     Lawrence Gough
#> 134                               Thin Ice episode      Bill Anderson
#> 135                            Knock Knock episode      Bill Anderson
#> 136                                 Oxygen episode     Charles Palmer
#> 137                               Extremis episode    Daniel Nettheim
#> 138    The Pyramid at the End of the World episode    Daniel Nettheim
#> 139                    The Lie of the Land episode          Wayne Yip
#> 140                        Empress of Mars episode          Wayne Yip
#> 141                    The Eaters of Light episode     Charles Palmer
#> 142                  World Enough and Time episode     Rachel Talalay
#> 143                       The Doctor Falls episode     Rachel Talalay
#> 144                      Twice Upon a Time special     Rachel Talalay
#> 145            The Woman Who Fell to Earth episode       Jamie Childs
#> 146                     The Ghost Monument episode      Mark Tonderai
#> 147                                   Rosa episode      Mark Tonderai
#> 148                    Arachnids in the UK episode  Sallie Aprahamian
#> 149                 The Tsuranga Conundrum episode   Jennifer Perrott
#> 150                   Demons of the Punjab episode       Jamie Childs
#> 151                               Kerblam! episode   Jennifer Perrott
#> 152                       The Witchfinders episode  Sallie Aprahamian
#> 153                      It Takes You Away episode       Jamie Childs
#> 154        The Battle of Ranskoor Av Kolos episode       Jamie Childs
#> 155                             Resolution special          Wayne Yip
#> 156                        Spyfall, Part 1 episode Jamie Magnus Stone
#> 157                        Spyfall, Part 2 episode    Lee Haven Jones
#> 158                              Orphan 55 episode    Lee Haven Jones
#> 159         Nikola Tesla's Night of Terror episode       Nida Manzoor
#> 160                 Fugitive of the Judoon episode       Nida Manzoor
#> 161                                Praxeus episode Jamie Magnus Stone
#> 162                       Can You Hear Me? episode      Emma Sullivan
#> 163          The Haunting of Villa Diodati episode      Emma Sullivan
#> 164              Ascension of the Cybermen episode Jamie Magnus Stone
#> 165                  The Timeless Children episode Jamie Magnus Stone
#> 166               Revolution of the Daleks special    Lee Haven Jones
#>                                  writer first_aired production_code uk_viewers
#> 1                      Russell T Davies  2005-03-26             1.1      10.81
#> 2                      Russell T Davies  2005-04-02             1.2       7.97
#> 3                           Mark Gatiss  2005-04-09             1.3       8.86
#> 4                      Russell T Davies  2005-04-16             1.4       7.63
#> 5                      Russell T Davies  2005-04-23             1.5       7.98
#> 6                       Robert Shearman  2005-04-30             1.6       8.63
#> 7                      Russell T Davies  2005-05-07             1.7       8.01
#> 8                          Paul Cornell  2005-05-14             1.8       8.06
#> 9                         Steven Moffat  2005-05-21             1.9       7.11
#> 10                        Steven Moffat  2005-05-28             1.1       6.86
#> 11                     Russell T Davies  2005-06-04            1.11       7.68
#> 12                     Russell T Davies  2005-06-11            1.12       6.81
#> 13                     Russell T Davies  2005-06-18            1.13       6.91
#> 14                     Russell T Davies  2005-12-25              2X       9.84
#> 15                     Russell T Davies  2006-04-15             2.1       8.62
#> 16                     Russell T Davies  2006-04-22             2.2       9.24
#> 17                       Toby Whithouse  2006-04-29             2.3       8.31
#> 18                        Steven Moffat  2006-05-06             2.4       7.90
#> 19                           Tom MacRae  2006-05-13             2.5       9.22
#> 20                           Tom MacRae  2006-05-20             2.6       7.63
#> 21                          Mark Gatiss  2006-05-27             2.7       6.76
#> 22                           Matt Jones  2006-06-03             2.8       6.32
#> 23                           Matt Jones  2006-06-10             2.9       6.08
#> 24                     Russell T Davies  2006-06-17            2.10       6.66
#> 25                       Matthew Graham  2006-06-24            2.11       7.14
#> 26                     Russell T Davies  2006-07-01            2.12       8.19
#> 27                     Russell T Davies  2006-07-08            2.13       8.22
#> 28                     Russell T Davies  2006-12-25              3X       9.35
#> 29                     Russell T Davies  2007-03-31             3.1       8.71
#> 30                       Gareth Roberts  2007-04-07             3.2       7.23
#> 31                     Russell T Davies  2007-04-14             3.3       8.41
#> 32                         Helen Raynor  2007-04-21             3.4       6.69
#> 33                         Helen Raynor  2007-04-28             3.5       6.97
#> 34                    Stephen Greenhorn  2007-05-05             3.6       7.19
#> 35                       Chris Chibnall  2007-05-19             3.7       7.41
#> 36                         Paul Cornell  2007-05-26             3.8       7.74
#> 37                         Paul Cornell  2007-06-02             3.9       7.21
#> 38                        Steven Moffat  2007-06-09            3.10       6.62
#> 39                     Russell T Davies  2007-06-16            3.11       7.84
#> 40                     Russell T Davies  2007-06-23            3.12       7.51
#> 41                     Russell T Davies  2007-06-30            3.13       8.61
#> 42                     Russell T Davies  2007-12-25              4X      13.31
#> 43                     Russell T Davies  2008-04-05             4.1       9.14
#> 44                          James Moran  2008-04-12             4.3       9.04
#> 45                         Keith Temple  2008-04-19             4.2       7.50
#> 46                         Helen Raynor  2008-04-26             4.4       7.06
#> 47                         Helen Raynor  2008-05-03             4.5       6.53
#> 48                    Stephen Greenhorn  2008-05-10             4.6       7.33
#> 49                       Gareth Roberts  2008-05-17             4.7       8.41
#> 50                        Steven Moffat  2008-05-31             4.9       6.27
#> 51                        Steven Moffat  2008-06-07            4.10       7.84
#> 52                     Russell T Davies  2008-06-14             4.8       8.05
#> 53                     Russell T Davies  2008-06-21            4.11       8.09
#> 54                     Russell T Davies  2008-06-28            4.12       8.78
#> 55                     Russell T Davies  2008-07-05            4.13      10.57
#> 56                     Russell T Davies  2008-12-25            4.14      13.10
#> 57    Russell T Davies & Gareth Roberts  2009-04-11            4.15       9.75
#> 58         Russell T Davies & Phil Ford  2009-11-15            4.16      10.32
#> 59                     Russell T Davies  2009-12-25            4.17      12.04
#> 60                     Russell T Davies  2010-01-01            4.18      12.27
#> 61                        Steven Moffat  2010-04-03             1.1      10.09
#> 62                        Steven Moffat  2010-04-10             1.2       8.42
#> 63                          Mark Gatiss  2010-04-17             1.3       8.21
#> 64                        Steven Moffat  2010-04-24             1.4       8.59
#> 65                        Steven Moffat  2010-05-01             1.5       8.50
#> 66                       Toby Whithouse  2010-05-08             1.6       7.68
#> 67                            Simon Nye  2010-05-15             1.7       7.55
#> 68                       Chris Chibnall  2010-05-22             1.8       6.49
#> 69                       Chris Chibnall  2010-05-29             1.9       7.49
#> 70                       Richard Curtis  2010-06-05             1.1       6.76
#> 71                       Gareth Roberts  2010-06-12            1.11       6.44
#> 72                        Steven Moffat  2010-06-19            1.12       7.57
#> 73                        Steven Moffat  2010-06-26            1.13       6.70
#> 74                        Steven Moffat  2010-12-25             2.X      12.11
#> 75                        Steven Moffat  2011-04-23             2.1       8.86
#> 76                        Steven Moffat  2011-04-30             2.2       7.30
#> 77                     Stephen Thompson  2011-05-07             2.9       7.85
#> 78                          Neil Gaiman  2011-05-14             2.3       7.97
#> 79                       Matthew Graham  2011-05-21             2.5       7.35
#> 80                       Matthew Graham  2011-05-28             2.6       6.72
#> 81                        Steven Moffat  2011-06-04             2.7       7.51
#> 82                        Steven Moffat  2011-08-27             2.8       8.10
#> 83                          Mark Gatiss  2011-09-03             2.4       7.07
#> 84                           Tom MacRae  2011-09-10            2.10       7.60
#> 85                       Toby Whithouse  2011-09-17            2.11       6.77
#> 86                       Gareth Roberts  2011-09-24            2.12       6.93
#> 87                        Steven Moffat  2011-10-01            2.13       7.67
#> 88                        Steven Moffat  2011-12-25            <NA>      10.77
#> 89                        Steven Moffat  2012-09-01            <NA>       8.33
#> 90                       Chris Chibnall  2012-09-08            <NA>       7.57
#> 91                       Toby Whithouse  2012-09-15            <NA>       8.42
#> 92                       Chris Chibnall  2012-09-22            <NA>       7.67
#> 93                        Steven Moffat  2012-09-29            <NA>       7.82
#> 94                        Steven Moffat  2012-12-25            <NA>       9.87
#> 95                        Steven Moffat  2013-03-30            <NA>       8.44
#> 96                           Neil Cross  2013-04-06            <NA>       7.45
#> 97                          Mark Gatiss  2013-04-13            <NA>       7.37
#> 98                           Neil Cross  2013-04-20            <NA>       6.61
#> 99                     Stephen Thompson  2013-04-27            <NA>       6.50
#> 100                         Mark Gatiss  2013-05-04            <NA>       6.47
#> 101                         Neil Gaiman  2013-05-11            <NA>       6.64
#> 102                       Steven Moffat  2013-05-18            <NA>       7.45
#> 103                       Steven Moffat  2013-11-23            <NA>      12.80
#> 104                       Steven Moffat  2013-12-25            <NA>      11.14
#> 105                       Steven Moffat  2014-08-23            <NA>       9.17
#> 106           Phil Ford & Steven Moffat  2014-08-30            <NA>       7.29
#> 107                         Mark Gatiss  2014-09-06            <NA>       7.28
#> 108                       Steven Moffat  2014-09-13            <NA>       7.01
#> 109    Stephen Thompson & Steven Moffat  2014-09-20            <NA>       6.99
#> 110      Gareth Roberts & Steven Moffat  2014-09-27            <NA>       6.82
#> 111                       Peter Harness  2014-10-04            <NA>       6.91
#> 112                     Jamie Mathieson  2014-10-11            <NA>       7.11
#> 113                     Jamie Mathieson  2014-10-18            <NA>       6.71
#> 114                Frank Cottrell-Boyce  2014-10-25            <NA>       6.92
#> 115                       Steven Moffat  2014-11-01            <NA>       7.34
#> 116                       Steven Moffat  2014-11-08            <NA>       7.60
#> 117                       Steven Moffat  2014-12-25            <NA>       8.28
#> 118                       Steven Moffat  2015-09-19            <NA>       6.54
#> 119                       Steven Moffat  2015-09-26            <NA>       5.71
#> 120                      Toby Whithouse  2015-10-03            <NA>       5.63
#> 121                      Toby Whithouse  2015-10-10            <NA>       6.05
#> 122   Jamie Mathieson and Steven Moffat  2015-10-17            <NA>       6.56
#> 123                  Catherine Tregenna  2015-10-24            <NA>       6.11
#> 124                       Peter Harness  2015-10-31            <NA>       5.76
#> 125     Peter Harness and Steven Moffat  2015-11-07            <NA>       6.03
#> 126                         Mark Gatiss  2015-11-14            <NA>       5.61
#> 127                       Sarah Dollard  2015-11-21            <NA>       6.05
#> 128                       Steven Moffat  2015-11-28            <NA>       6.19
#> 129                       Steven Moffat  2015-12-05            <NA>       6.17
#> 130                       Steven Moffat  2015-12-25            <NA>       7.69
#> 131                       Steven Moffat  2016-12-25            <NA>       7.83
#> 132                       Steven Moffat  2017-04-15            <NA>       6.68
#> 133                Frank Cottrell-Boyce  2017-04-22            <NA>       5.98
#> 134                       Sarah Dollard  2017-04-29            <NA>       5.61
#> 135                       Mike Bartlett  2017-05-06            <NA>       5.73
#> 136                     Jamie Mathieson  2017-05-13            <NA>       5.27
#> 137                       Steven Moffat  2017-05-20            <NA>       5.53
#> 138     Peter Harness and Steven Moffat  2017-05-27            <NA>       5.79
#> 139                      Toby Whithouse  2017-06-03            <NA>       4.82
#> 140                         Mark Gatiss  2017-06-10            <NA>       5.02
#> 141                          Rona Munro  2017-06-17            <NA>       4.73
#> 142                       Steven Moffat  2017-06-24            <NA>       5.00
#> 143                       Steven Moffat  2017-07-01            <NA>       5.30
#> 144                       Steven Moffat  2017-12-25            <NA>       7.92
#> 145                      Chris Chibnall  2018-10-07            <NA>      10.96
#> 146                      Chris Chibnall  2018-10-14            <NA>       9.00
#> 147 Malorie Blackman and Chris Chibnall  2018-10-21            <NA>       8.41
#> 148                      Chris Chibnall  2018-10-28            <NA>       8.22
#> 149                      Chris Chibnall  2018-11-04            <NA>       7.76
#> 150                         Vinay Patel  2018-11-11            <NA>       7.48
#> 151                        Pete McTighe  2018-11-18            <NA>       7.46
#> 152                       Joy Wilkinson  2018-11-25            <NA>       7.21
#> 153                             Ed Hime  2018-12-02            <NA>       6.42
#> 154                      Chris Chibnall  2018-12-09            <NA>       6.65
#> 155                      Chris Chibnall  2019-01-01            <NA>       7.13
#> 156                      Chris Chibnall  2020-01-01            <NA>       6.89
#> 157                      Chris Chibnall  2020-01-05            <NA>       6.07
#> 158                             Ed Hime  2020-01-12            <NA>       5.38
#> 159                       Nina Metivier  2020-01-19            <NA>       5.20
#> 160      Vinay Patel and Chris Chibnall  2020-01-26            <NA>       5.57
#> 161     Pete McTighe and Chris Chibnall  2020-02-02            <NA>       5.22
#> 162   Charlene James and Chris Chibnall  2020-02-09            <NA>       4.90
#> 163                     Maxine Alderton  2020-02-16            <NA>       5.07
#> 164                      Chris Chibnall  2020-02-23            <NA>       4.99
#> 165                      Chris Chibnall  2020-03-01            <NA>       4.69
#> 166                      Chris Chibnall  2021-01-01            <NA>       6.35
#>     rating
#> 1       76
#> 2       76
#> 3       80
#> 4       82
#> 5       81
#> 6       84
#> 7       81
#> 8       83
#> 9       84
#> 10      85
#> 11      82
#> 12      86
#> 13      89
#> 14      84
#> 15      85
#> 16      83
#> 17      85
#> 18      84
#> 19      86
#> 20      86
#> 21      84
#> 22      85
#> 23      86
#> 24      76
#> 25      83
#> 26      86
#> 27      89
#> 28      84
#> 29      88
#> 30      87
#> 31      85
#> 32      86
#> 33      85
#> 34      86
#> 35      85
#> 36      86
#> 37      86
#> 38      87
#> 39      87
#> 40      87
#> 41      88
#> 42      86
#> 43      88
#> 44      87
#> 45      87
#> 46      87
#> 47      88
#> 48      88
#> 49      86
#> 50      89
#> 51      89
#> 52      86
#> 53      88
#> 54      91
#> 55      91
#> 56      86
#> 57      88
#> 58      88
#> 59      87
#> 60      89
#> 61      86
#> 62      86
#> 63      84
#> 64      87
#> 65      86
#> 66      86
#> 67      84
#> 68      86
#> 69      85
#> 70      86
#> 71      87
#> 72      88
#> 73      89
#> 74      83
#> 75      88
#> 76      87
#> 77      86
#> 78      87
#> 79      85
#> 80      86
#> 81      88
#> 82      85
#> 83      86
#> 84      85
#> 85      86
#> 86      86
#> 87      86
#> 88      84
#> 89      89
#> 90      87
#> 91      85
#> 92      87
#> 93      88
#> 94      87
#> 95      87
#> 96      84
#> 97      84
#> 98      85
#> 99      85
#> 100     85
#> 101     84
#> 102     88
#> 103     88
#> 104     83
#> 105     82
#> 106     84
#> 107     82
#> 108     82
#> 109     84
#> 110     83
#> 111     82
#> 112     85
#> 113     85
#> 114     83
#> 115     85
#> 116     83
#> 117     82
#> 118     84
#> 119     83
#> 120     84
#> 121     83
#> 122     82
#> 123     81
#> 124     82
#> 125     84
#> 126     78
#> 127     84
#> 128     80
#> 129     82
#> 130     82
#> 131     82
#> 132     83
#> 133     83
#> 134     84
#> 135     83
#> 136     83
#> 137     82
#> 138     82
#> 139     82
#> 140     83
#> 141     81
#> 142     85
#> 143     83
#> 144     81
#> 145     83
#> 146     82
#> 147     83
#> 148     83
#> 149     79
#> 150     80
#> 151     81
#> 152     81
#> 153     80
#> 154     79
#> 155     80
#> 156     82
#> 157     82
#> 158     77
#> 159     79
#> 160     83
#> 161     78
#> 162     78
#> 163     80
#> 164     81
#> 165     82
#> 166     79
```
