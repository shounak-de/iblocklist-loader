#!/bin/sh

# Generic iblocklist.com ipset loader for ipset v4 and v6 (Extended version with more lists and options)
# Author: redhat27, Version 1.2
# snbforums thread: https://www.snbforums.com/threads/iblocklist-com-generic-ipset-loader-for-ipset-v6-and-v4.37976/
# credits for v6 implementation: http://www.unix.com/shell-programming-and-scripting/233825-convert-ip-ranges-cidr-netblocks.html

# Available free lists from [https://www.iblocklist.com/lists] Format:
# -------List (General)---Maintainer---Download URL-------------------------------------------Traffic
List001="Pedophiles       I-Blocklist  http://list.iblocklist.com/?list=dufcxgnbjsdwmwctgfuj  src"
List002="level1           Bluetack     http://list.iblocklist.com/?list=ydxerpxkpcfqjaybcssw  src"
List003="level2           Bluetack     http://list.iblocklist.com/?list=gyisgnzbhppbvsphucsw  src"
List004="level3           Bluetack     http://list.iblocklist.com/?list=uwnukjqktoggdknzrhgh  src"
List005="edu              Bluetack     http://list.iblocklist.com/?list=imlmncgrkbnacgcwfjvh  src"
List006="rangetest        Bluetack     http://list.iblocklist.com/?list=plkehquoahljmyxjixpu  src"
List007="bogon            Bluetack     http://list.iblocklist.com/?list=gihxqmhyunbxhbmgqrla  src"
List008="ads              Bluetack     http://list.iblocklist.com/?list=dgxtneitpuvgqqcpfulq  src"
List009="spyware          Bluetack     http://list.iblocklist.com/?list=llvtlsjyoyiczbkjsxpf  src"
List010="proxy            Bluetack     http://list.iblocklist.com/?list=xoebmbyexwuiogmbyprb  src"
List011="badpeers         Bluetack     http://list.iblocklist.com/?list=cwworuawihqvocglcoss  src"
List012="Microsoft        Bluetack     http://list.iblocklist.com/?list=xshktygkujudfnjfioro  src"
List013="spider           Bluetack     http://list.iblocklist.com/?list=mcvxsnihddgutbjfbghy  src"
List014="hijacked         Bluetack     http://list.iblocklist.com/?list=usrcshglbiilevmyfhse  src"
List015="dshield          Bluetack     http://list.iblocklist.com/?list=xpbqleszmajjesnzddhv  src"
List016="forumspam        Bluetack     http://list.iblocklist.com/?list=ficutxiwawokxlcyoeye  src"
List017="webexploit       Bluetack     http://list.iblocklist.com/?list=ghlzqtqxnzctvvajwwag  src"
List018="iana-reserved    Bluetack     http://list.iblocklist.com/?list=bcoepfyewziejvcqyhqo  src"
List019="iana-private     Bluetack     http://list.iblocklist.com/?list=cslpybexmxyuacbyuvib  src"
List020="iana-multicast   Bluetack     http://list.iblocklist.com/?list=pwqnlynprfgtjbgqoizj  src"
List021="NonLanComputers  Bluetack     http://list.iblocklist.com/?list=jhaoawihmfxgnvmaqffp  src"
List022="exclusions       Bluetack     http://list.iblocklist.com/?list=mtxmiireqmjzazcsoiem  src"
List023="DROP             Spamhaus     http://list.iblocklist.com/?list=zbdlwrqkabxbcppvrnos  src"
List024="ZeuS             abuse        http://list.iblocklist.com/?list=ynkdjqsjyfmilsgbogqf  src"
List025="SpyEye           abuse        http://list.iblocklist.com/?list=zvjxsfuvdhoxktpeiokq  src"
List026="Palevo           abuse        http://list.iblocklist.com/?list=erqajhwrxiuvjxqrrwfj  src"
List027="Malicious        CI-Army      http://list.iblocklist.com/?list=npkuuhuxcsllnhoamkvm  src"
List028="malc0de          malc0de      http://list.iblocklist.com/?list=pbqcylkejciyhmwttify  src"
List029="adservers        Yoyo         http://list.iblocklist.com/?list=zhogegszwduurnvsyhdf  src"
List030="bogon            cidr-report  http://list.iblocklist.com/?list=lujdnbasfaaixitgmxpp  src"
List031="CruzITWebAttacks CruzIT       http://list.iblocklist.com/?list=czvaehmjpsnwwttrdoyl  src"
List032="Business-ISPs    TBG          http://list.iblocklist.com/?list=jcjfaxgyyshvdbceroxf  src"
List033="Primary-Threats  TBG          http://list.iblocklist.com/?list=ijfqtofzixtwayqovmxn  src"
List034="Hijacked         TBG          http://list.iblocklist.com/?list=tbnuqfclfkemqivekikv  src"
List035="Bogon            TBG          http://list.iblocklist.com/?list=ewqglwibdgjttwttrinl  src"
List036="Search-Engines   TBG          http://list.iblocklist.com/?list=pfefqteoxlfzopecdtyw  src"
List037="Corporate-Ranges TBG          http://list.iblocklist.com/?list=ecqbsykllnadihkdirsh  src"
# -------List (Orgs)------Maintainer---Download URL-------------------------------------------Traffic
List038="TheOnionRouter   I-Blocklist  http://list.iblocklist.com/?list=togdoptykrlolpddwbvz  src,dst"
List039="Apple            I-Blocklist  http://list.iblocklist.com/?list=aphcqvpxuqgrkgufjruj  src,dst"
List040="LogMeIn          I-Blocklist  http://list.iblocklist.com/?list=tgbankumtwtrzllndbmb  src,dst"
List041="Steam            I-Blocklist  http://list.iblocklist.com/?list=cnxkgiklecdaihzukrud  src,dst"
List042="Xfire            I-Blocklist  http://list.iblocklist.com/?list=ppqqnyihmcrryraaqsjo  src,dst"
List043="Blizzard         I-Blocklist  http://list.iblocklist.com/?list=ercbntshuthyykfkmhxc  src,dst"
List044="Ubisoft          I-Blocklist  http://list.iblocklist.com/?list=etmcrglomupyxtaebzht  src,dst"
List045="Nintendo         I-Blocklist  http://list.iblocklist.com/?list=pevkykuhgaegqyayzbnr  src,dst"
List046="Activision       I-Blocklist  http://list.iblocklist.com/?list=gfnxlhxsijzrcuxwzebb  src,dst"
List047="SonyOnlineEnt    I-Blocklist  http://list.iblocklist.com/?list=tukpvrvlubsputmkmiwg  src,dst"
List048="CrowdCtrlPrds    I-Blocklist  http://list.iblocklist.com/?list=eveiyhgmusglurfmjyag  src,dst"
List049="LindenLab        I-Blocklist  http://list.iblocklist.com/?list=qnjdimxnaupjmpqolxcv  src,dst"
List050="ElectronicArts   I-Blocklist  http://list.iblocklist.com/?list=ejqebpcdmffinaetsvxj  src,dst"
List051="SquareEnix       I-Blocklist  http://list.iblocklist.com/?list=odyaqontcydnodrlyina  src,dst"
List052="NCsoft           I-Blocklist  http://list.iblocklist.com/?list=mwjuwmebrnzyyxpbezxu  src,dst"
List053="RiotGames        I-Blocklist  http://list.iblocklist.com/?list=sdlvfabdjvrdttfjotcy  src,dst"
List054="PunkBuster       I-Blocklist  http://list.iblocklist.com/?list=zvwwndvzulqcltsicwdg  src,dst"
List055="Joost            I-Blocklist  http://list.iblocklist.com/?list=alxugfmeszbhpxqfdits  src,dst"
List056="Pandora          I-Blocklist  http://list.iblocklist.com/?list=aevzidimyvwybzkletsg  src,dst"
List057="ThePirateBay     I-Blocklist  http://list.iblocklist.com/?list=nzldzlpkgrcncdomnttb  src,dst"
# -------List (ISP)-------Maintainer---Download URL [Note: Don't block your own ISP!]---------Traffic
List058="AOL              I-Blocklist  http://list.iblocklist.com/?list=toboaiysofkflwgrttmb  src,dst"
List059="Comcast          I-Blocklist  http://list.iblocklist.com/?list=rsgyxvuklicibautguia  src,dst"
List060="Cablevision      I-Blocklist  http://list.iblocklist.com/?list=dwwbsmzirrykdlvpqozb  src,dst"
List061="Verizon          I-Blocklist  http://list.iblocklist.com/?list=cdmdbprvldivlqsaqjol  src,dst"
List062="ATT              I-Blocklist  http://list.iblocklist.com/?list=grbtkzijgrowvobvessf  src,dst"
List063="CoxComm          I-Blocklist  http://list.iblocklist.com/?list=nlgdvmvfxvoimdunmuju  src,dst"
List064="TimeWarnerCble   I-Blocklist  http://list.iblocklist.com/?list=aqtsnttnqmcucwrjmohd  src,dst"
List065="Charter          I-Blocklist  http://list.iblocklist.com/?list=htnzojgossawhpkbulqw  src,dst"
List066="Embarq           I-Blocklist  http://list.iblocklist.com/?list=twdblifaysaqtypevvdp  src,dst"
List067="Suddenlink       I-Blocklist  http://list.iblocklist.com/?list=psaoblrwylfrdsspfuiq  src,dst"
List068="Sprint           I-Blocklist  http://list.iblocklist.com/?list=hngtqrhhuadlceqxbrob  src,dst"
# -------List (Country)---Maintainer---Download URL-------------------------------------------Traffic
List069="Afghanistan      I-Blocklist  http://list.iblocklist.com/?list=af                    src,dst"
List070="Aland-Islands    I-Blocklist  http://list.iblocklist.com/?list=ax                    src,dst"
List071="Albania          I-Blocklist  http://list.iblocklist.com/?list=al                    src,dst"
List072="Algeria          I-Blocklist  http://list.iblocklist.com/?list=dz                    src,dst"
List073="American-Samoa   I-Blocklist  http://list.iblocklist.com/?list=as                    src,dst"
List074="Andorra          I-Blocklist  http://list.iblocklist.com/?list=ad                    src,dst"
List075="Angola           I-Blocklist  http://list.iblocklist.com/?list=ao                    src,dst"
List076="Anguilla         I-Blocklist  http://list.iblocklist.com/?list=ai                    src,dst"
List077="AntiguaBarbuda   I-Blocklist  http://list.iblocklist.com/?list=ag                    src,dst"
List078="Antilles         I-Blocklist  http://list.iblocklist.com/?list=an                    src,dst"
List079="Argentina        I-Blocklist  http://list.iblocklist.com/?list=ar                    src,dst"
List080="Armenia          I-Blocklist  http://list.iblocklist.com/?list=am                    src,dst"
List081="Aruba            I-Blocklist  http://list.iblocklist.com/?list=aw                    src,dst"
List082="Asia-Pas-Loc     I-Blocklist  http://list.iblocklist.com/?list=ap                    src,dst"
List083="Australia        I-Blocklist  http://list.iblocklist.com/?list=au                    src,dst"
List084="Austria          I-Blocklist  http://list.iblocklist.com/?list=at                    src,dst"
List085="Azerbaijan       I-Blocklist  http://list.iblocklist.com/?list=az                    src,dst"
List086="Bahamas          I-Blocklist  http://list.iblocklist.com/?list=bs                    src,dst"
List087="Bahrain          I-Blocklist  http://list.iblocklist.com/?list=bh                    src,dst"
List088="Bangladesh       I-Blocklist  http://list.iblocklist.com/?list=bd                    src,dst"
List089="Barbados         I-Blocklist  http://list.iblocklist.com/?list=bb                    src,dst"
List090="Belarus          I-Blocklist  http://list.iblocklist.com/?list=by                    src,dst"
List091="Belgium          I-Blocklist  http://list.iblocklist.com/?list=be                    src,dst"
List092="Belize           I-Blocklist  http://list.iblocklist.com/?list=bz                    src,dst"
List093="Benin            I-Blocklist  http://list.iblocklist.com/?list=bj                    src,dst"
List094="Bermuda          I-Blocklist  http://list.iblocklist.com/?list=bm                    src,dst"
List095="Bhutan           I-Blocklist  http://list.iblocklist.com/?list=bt                    src,dst"
List096="Bolivia          I-Blocklist  http://list.iblocklist.com/?list=bo                    src,dst"
List097="Bosnia           I-Blocklist  http://list.iblocklist.com/?list=ba                    src,dst"
List098="Botswana         I-Blocklist  http://list.iblocklist.com/?list=bw                    src,dst"
List099="Brazil           I-Blocklist  http://list.iblocklist.com/?list=br                    src,dst"
List100="Brunei           I-Blocklist  http://list.iblocklist.com/?list=bn                    src,dst"
List101="Bulgaria         I-Blocklist  http://list.iblocklist.com/?list=bg                    src,dst"
List102="Burkina-Faso     I-Blocklist  http://list.iblocklist.com/?list=bf                    src,dst"
List103="Burundi          I-Blocklist  http://list.iblocklist.com/?list=bi                    src,dst"
List104="Cambodia         I-Blocklist  http://list.iblocklist.com/?list=kh                    src,dst"
List105="Cameroon         I-Blocklist  http://list.iblocklist.com/?list=cm                    src,dst"
List106="Canada           I-Blocklist  http://list.iblocklist.com/?list=ca                    src,dst"
List107="Cape-Verde       I-Blocklist  http://list.iblocklist.com/?list=cv                    src,dst"
List108="Cayman-Islands   I-Blocklist  http://list.iblocklist.com/?list=ky                    src,dst"
List109="Chile            I-Blocklist  http://list.iblocklist.com/?list=cl                    src,dst"
List110="China            I-Blocklist  http://list.iblocklist.com/?list=cn                    src,dst"
List111="Colombia         I-Blocklist  http://list.iblocklist.com/?list=co                    src,dst"
List112="Congo            I-Blocklist  http://list.iblocklist.com/?list=cd                    src,dst"
List113="Congo            I-Blocklist  http://list.iblocklist.com/?list=cg                    src,dst"
List114="Cook-Islands     I-Blocklist  http://list.iblocklist.com/?list=ck                    src,dst"
List115="Costa-Rica       I-Blocklist  http://list.iblocklist.com/?list=cr                    src,dst"
List116="Cote-Divoire     I-Blocklist  http://list.iblocklist.com/?list=ci                    src,dst"
List117="Croatia          I-Blocklist  http://list.iblocklist.com/?list=hr                    src,dst"
List118="CtrlAfricanRep   I-Blocklist  http://list.iblocklist.com/?list=cf                    src,dst"
List119="Cuba             I-Blocklist  http://list.iblocklist.com/?list=cu                    src,dst"
List120="Cyprus           I-Blocklist  http://list.iblocklist.com/?list=cy                    src,dst"
List121="Czech-Republic   I-Blocklist  http://list.iblocklist.com/?list=cz                    src,dst"
List122="Denmark          I-Blocklist  http://list.iblocklist.com/?list=dk                    src,dst"
List123="Djibouti         I-Blocklist  http://list.iblocklist.com/?list=dj                    src,dst"
List124="DominicanRep     I-Blocklist  http://list.iblocklist.com/?list=do                    src,dst"
List125="Ecuador          I-Blocklist  http://list.iblocklist.com/?list=ec                    src,dst"
List126="Egypt            I-Blocklist  http://list.iblocklist.com/?list=eg                    src,dst"
List127="El-Salvador      I-Blocklist  http://list.iblocklist.com/?list=sv                    src,dst"
List128="Eqtrl-Guinea     I-Blocklist  http://list.iblocklist.com/?list=gq                    src,dst"
List129="Eritrea          I-Blocklist  http://list.iblocklist.com/?list=er                    src,dst"
List130="Estonia          I-Blocklist  http://list.iblocklist.com/?list=ee                    src,dst"
List131="Ethiopia         I-Blocklist  http://list.iblocklist.com/?list=et                    src,dst"
List132="European-Union   I-Blocklist  http://list.iblocklist.com/?list=eu                    src,dst"
List133="Faroe-Islands    I-Blocklist  http://list.iblocklist.com/?list=fo                    src,dst"
List134="Fiji             I-Blocklist  http://list.iblocklist.com/?list=fj                    src,dst"
List135="Finland          I-Blocklist  http://list.iblocklist.com/?list=fi                    src,dst"
List136="France           I-Blocklist  http://list.iblocklist.com/?list=fr                    src,dst"
List137="French-Guiana    I-Blocklist  http://list.iblocklist.com/?list=gf                    src,dst"
List138="Fr-Polynesia     I-Blocklist  http://list.iblocklist.com/?list=pf                    src,dst"
List139="Gabon            I-Blocklist  http://list.iblocklist.com/?list=ga                    src,dst"
List140="Gambia           I-Blocklist  http://list.iblocklist.com/?list=gm                    src,dst"
List141="Georgia          I-Blocklist  http://list.iblocklist.com/?list=ge                    src,dst"
List142="Germany          I-Blocklist  http://list.iblocklist.com/?list=de                    src,dst"
List143="Ghana            I-Blocklist  http://list.iblocklist.com/?list=gh                    src,dst"
List144="Gibraltar        I-Blocklist  http://list.iblocklist.com/?list=gi                    src,dst"
List145="Greece           I-Blocklist  http://list.iblocklist.com/?list=gr                    src,dst"
List146="Greenland        I-Blocklist  http://list.iblocklist.com/?list=gl                    src,dst"
List147="Grenada          I-Blocklist  http://list.iblocklist.com/?list=gd                    src,dst"
List148="Guadeloupe       I-Blocklist  http://list.iblocklist.com/?list=gp                    src,dst"
List149="Guam             I-Blocklist  http://list.iblocklist.com/?list=gu                    src,dst"
List150="Guatemala        I-Blocklist  http://list.iblocklist.com/?list=gt                    src,dst"
List151="Guernsey         I-Blocklist  http://list.iblocklist.com/?list=gg                    src,dst"
List152="Guinea-bissau    I-Blocklist  http://list.iblocklist.com/?list=gw                    src,dst"
List153="Guinea           I-Blocklist  http://list.iblocklist.com/?list=gn                    src,dst"
List154="Guyana           I-Blocklist  http://list.iblocklist.com/?list=gy                    src,dst"
List155="Haiti            I-Blocklist  http://list.iblocklist.com/?list=ht                    src,dst"
List156="Honduras         I-Blocklist  http://list.iblocklist.com/?list=hn                    src,dst"
List157="Hong-Kong        I-Blocklist  http://list.iblocklist.com/?list=hk                    src,dst"
List158="Hungary          I-Blocklist  http://list.iblocklist.com/?list=hu                    src,dst"
List159="Iceland          I-Blocklist  http://list.iblocklist.com/?list=is                    src,dst"
List160="India            I-Blocklist  http://list.iblocklist.com/?list=in                    src,dst"
List161="Indian-Ocean     I-Blocklist  http://list.iblocklist.com/?list=io                    src,dst"
List162="Indonesia        I-Blocklist  http://list.iblocklist.com/?list=id                    src,dst"
List163="Iran             I-Blocklist  http://list.iblocklist.com/?list=ir                    src,dst"
List164="Iraq             I-Blocklist  http://list.iblocklist.com/?list=iq                    src,dst"
List165="Ireland          I-Blocklist  http://list.iblocklist.com/?list=ie                    src,dst"
List166="Isle-of-Man      I-Blocklist  http://list.iblocklist.com/?list=im                    src,dst"
List167="Israel           I-Blocklist  http://list.iblocklist.com/?list=il                    src,dst"
List168="Italy            I-Blocklist  http://list.iblocklist.com/?list=it                    src,dst"
List169="Jamaica          I-Blocklist  http://list.iblocklist.com/?list=jm                    src,dst"
List170="Japan            I-Blocklist  http://list.iblocklist.com/?list=jp                    src,dst"
List171="Jersey           I-Blocklist  http://list.iblocklist.com/?list=je                    src,dst"
List172="Jordan           I-Blocklist  http://list.iblocklist.com/?list=jo                    src,dst"
List173="Kazakhstan       I-Blocklist  http://list.iblocklist.com/?list=kz                    src,dst"
List174="Kenya            I-Blocklist  http://list.iblocklist.com/?list=ke                    src,dst"
List175="Kiribati         I-Blocklist  http://list.iblocklist.com/?list=ki                    src,dst"
List176="Korea            I-Blocklist  http://list.iblocklist.com/?list=kp                    src,dst"
List177="Korea            I-Blocklist  http://list.iblocklist.com/?list=kr                    src,dst"
List178="Kuwait           I-Blocklist  http://list.iblocklist.com/?list=kw                    src,dst"
List179="Kyrgyzstan       I-Blocklist  http://list.iblocklist.com/?list=kg                    src,dst"
List180="Lao              I-Blocklist  http://list.iblocklist.com/?list=la                    src,dst"
List181="Latvia           I-Blocklist  http://list.iblocklist.com/?list=lv                    src,dst"
List182="Lebanon          I-Blocklist  http://list.iblocklist.com/?list=lb                    src,dst"
List183="Lesotho          I-Blocklist  http://list.iblocklist.com/?list=ls                    src,dst"
List184="Liberia          I-Blocklist  http://list.iblocklist.com/?list=lr                    src,dst"
List185="Libya            I-Blocklist  http://list.iblocklist.com/?list=ly                    src,dst"
List186="Liechtenstein    I-Blocklist  http://list.iblocklist.com/?list=li                    src,dst"
List187="Lithuania        I-Blocklist  http://list.iblocklist.com/?list=lt                    src,dst"
List188="Luxembourg       I-Blocklist  http://list.iblocklist.com/?list=lu                    src,dst"
List189="Macau            I-Blocklist  http://list.iblocklist.com/?list=mo                    src,dst"
List190="Macedonia        I-Blocklist  http://list.iblocklist.com/?list=mk                    src,dst"
List191="Madagascar       I-Blocklist  http://list.iblocklist.com/?list=mg                    src,dst"
List192="Malawi           I-Blocklist  http://list.iblocklist.com/?list=mw                    src,dst"
List193="Malaysia         I-Blocklist  http://list.iblocklist.com/?list=my                    src,dst"
List194="Maldives         I-Blocklist  http://list.iblocklist.com/?list=mv                    src,dst"
List195="Mali             I-Blocklist  http://list.iblocklist.com/?list=ml                    src,dst"
List196="Malta            I-Blocklist  http://list.iblocklist.com/?list=mt                    src,dst"
List197="Marshall-Ils     I-Blocklist  http://list.iblocklist.com/?list=mh                    src,dst"
List198="Mauritania       I-Blocklist  http://list.iblocklist.com/?list=mr                    src,dst"
List199="Mauritius        I-Blocklist  http://list.iblocklist.com/?list=mu                    src,dst"
List200="Mexico           I-Blocklist  http://list.iblocklist.com/?list=mx                    src,dst"
List201="Micronesia       I-Blocklist  http://list.iblocklist.com/?list=fm                    src,dst"
List202="MoldovaRep       I-Blocklist  http://list.iblocklist.com/?list=md                    src,dst"
List203="Monaco           I-Blocklist  http://list.iblocklist.com/?list=mc                    src,dst"
List204="Mongolia         I-Blocklist  http://list.iblocklist.com/?list=mn                    src,dst"
List205="Montenegro       I-Blocklist  http://list.iblocklist.com/?list=me                    src,dst"
List206="Montserrat       I-Blocklist  http://list.iblocklist.com/?list=ms                    src,dst"
List207="Morocco          I-Blocklist  http://list.iblocklist.com/?list=ma                    src,dst"
List208="Mozambique       I-Blocklist  http://list.iblocklist.com/?list=mz                    src,dst"
List209="Myanmar          I-Blocklist  http://list.iblocklist.com/?list=mm                    src,dst"
List210="Namibia          I-Blocklist  http://list.iblocklist.com/?list=na                    src,dst"
List211="Nauru            I-Blocklist  http://list.iblocklist.com/?list=nr                    src,dst"
List212="Nepal            I-Blocklist  http://list.iblocklist.com/?list=np                    src,dst"
List213="Netherlands      I-Blocklist  http://list.iblocklist.com/?list=nl                    src,dst"
List214="New-Caledonia    I-Blocklist  http://list.iblocklist.com/?list=nc                    src,dst"
List215="New-Zealand      I-Blocklist  http://list.iblocklist.com/?list=nz                    src,dst"
List216="Nicaragua        I-Blocklist  http://list.iblocklist.com/?list=ni                    src,dst"
List217="Nigeria          I-Blocklist  http://list.iblocklist.com/?list=ng                    src,dst"
List218="Niger            I-Blocklist  http://list.iblocklist.com/?list=ne                    src,dst"
List219="Niue             I-Blocklist  http://list.iblocklist.com/?list=nu                    src,dst"
List220="Norfolk-Island   I-Blocklist  http://list.iblocklist.com/?list=nf                    src,dst"
List221="Norway           I-Blocklist  http://list.iblocklist.com/?list=no                    src,dst"
List222="Nrth-Mariana     I-Blocklist  http://list.iblocklist.com/?list=mp                    src,dst"
List223="Oman             I-Blocklist  http://list.iblocklist.com/?list=om                    src,dst"
List224="Pakistan         I-Blocklist  http://list.iblocklist.com/?list=pk                    src,dst"
List225="Palau            I-Blocklist  http://list.iblocklist.com/?list=pw                    src,dst"
List226="PalestinianTty   I-Blocklist  http://list.iblocklist.com/?list=ps                    src,dst"
List227="Panama           I-Blocklist  http://list.iblocklist.com/?list=pa                    src,dst"
List228="PapuaNewGuinea   I-Blocklist  http://list.iblocklist.com/?list=pg                    src,dst"
List229="Paraguay         I-Blocklist  http://list.iblocklist.com/?list=py                    src,dst"
List230="Peru             I-Blocklist  http://list.iblocklist.com/?list=pe                    src,dst"
List231="Philippines      I-Blocklist  http://list.iblocklist.com/?list=ph                    src,dst"
List232="Poland           I-Blocklist  http://list.iblocklist.com/?list=pl                    src,dst"
List233="Portugal         I-Blocklist  http://list.iblocklist.com/?list=pt                    src,dst"
List234="Puerto-Rico      I-Blocklist  http://list.iblocklist.com/?list=pr                    src,dst"
List235="Qatar            I-Blocklist  http://list.iblocklist.com/?list=qa                    src,dst"
List236="Reunion          I-Blocklist  http://list.iblocklist.com/?list=re                    src,dst"
List237="Romania          I-Blocklist  http://list.iblocklist.com/?list=ro                    src,dst"
List238="Russia           I-Blocklist  http://list.iblocklist.com/?list=ru                    src,dst"
List239="Rwanda           I-Blocklist  http://list.iblocklist.com/?list=rw                    src,dst"
List240="Saint-Lucia      I-Blocklist  http://list.iblocklist.com/?list=lc                    src,dst"
List241="Saint-Martin     I-Blocklist  http://list.iblocklist.com/?list=mf                    src,dst"
List242="Saint-Vincent    I-Blocklist  http://list.iblocklist.com/?list=vc                    src,dst"
List243="Samoa            I-Blocklist  http://list.iblocklist.com/?list=ws                    src,dst"
List244="San-Marino       I-Blocklist  http://list.iblocklist.com/?list=sm                    src,dst"
List245="Saudi-Arabia     I-Blocklist  http://list.iblocklist.com/?list=sa                    src,dst"
List246="Senegal          I-Blocklist  http://list.iblocklist.com/?list=sn                    src,dst"
List247="Serbia           I-Blocklist  http://list.iblocklist.com/?list=rs                    src,dst"
List248="Seychelles       I-Blocklist  http://list.iblocklist.com/?list=sc                    src,dst"
List249="Sierra-Leone     I-Blocklist  http://list.iblocklist.com/?list=sl                    src,dst"
List250="Singapore        I-Blocklist  http://list.iblocklist.com/?list=sg                    src,dst"
List251="Slovakia         I-Blocklist  http://list.iblocklist.com/?list=sk                    src,dst"
List252="Slovenia         I-Blocklist  http://list.iblocklist.com/?list=si                    src,dst"
List253="SolomonIslands   I-Blocklist  http://list.iblocklist.com/?list=sb                    src,dst"
List254="South-Africa     I-Blocklist  http://list.iblocklist.com/?list=za                    src,dst"
List255="Spain            I-Blocklist  http://list.iblocklist.com/?list=es                    src,dst"
List256="Srb-Montenegro   I-Blocklist  http://list.iblocklist.com/?list=cs                    src,dst"
List257="Sri-Lanka        I-Blocklist  http://list.iblocklist.com/?list=lk                    src,dst"
List258="StKittsNevis     I-Blocklist  http://list.iblocklist.com/?list=kn                    src,dst"
List259="StPierreMiqln    I-Blocklist  http://list.iblocklist.com/?list=pm                    src,dst"
List260="Sudan            I-Blocklist  http://list.iblocklist.com/?list=sd                    src,dst"
List261="Suriname         I-Blocklist  http://list.iblocklist.com/?list=sr                    src,dst"
List262="Swaziland        I-Blocklist  http://list.iblocklist.com/?list=sz                    src,dst"
List263="Sweden           I-Blocklist  http://list.iblocklist.com/?list=se                    src,dst"
List264="Switzerland      I-Blocklist  http://list.iblocklist.com/?list=ch                    src,dst"
List265="SyrianArabRep    I-Blocklist  http://list.iblocklist.com/?list=sy                    src,dst"
List266="Taiwan           I-Blocklist  http://list.iblocklist.com/?list=tw                    src,dst"
List267="Tajikistan       I-Blocklist  http://list.iblocklist.com/?list=tj                    src,dst"
List268="Tanzania         I-Blocklist  http://list.iblocklist.com/?list=tz                    src,dst"
List269="Thailand         I-Blocklist  http://list.iblocklist.com/?list=th                    src,dst"
List270="Timor-leste      I-Blocklist  http://list.iblocklist.com/?list=tl                    src,dst"
List271="Togo             I-Blocklist  http://list.iblocklist.com/?list=tg                    src,dst"
List272="Tonga            I-Blocklist  http://list.iblocklist.com/?list=to                    src,dst"
List273="TrinidadTobago   I-Blocklist  http://list.iblocklist.com/?list=tt                    src,dst"
List274="Tunisia          I-Blocklist  http://list.iblocklist.com/?list=tn                    src,dst"
List275="Turkey           I-Blocklist  http://list.iblocklist.com/?list=tr                    src,dst"
List276="Turkmenistan     I-Blocklist  http://list.iblocklist.com/?list=tm                    src,dst"
List277="TurksCaicos      I-Blocklist  http://list.iblocklist.com/?list=tc                    src,dst"
List278="Tuvalu           I-Blocklist  http://list.iblocklist.com/?list=tv                    src,dst"
List279="UAE              I-Blocklist  http://list.iblocklist.com/?list=ae                    src,dst"
List280="Uganda           I-Blocklist  http://list.iblocklist.com/?list=ug                    src,dst"
List281="Ukraine          I-Blocklist  http://list.iblocklist.com/?list=ua                    src,dst"
List282="United-Kingdom   I-Blocklist  http://list.iblocklist.com/?list=gb                    src,dst"
List283="United-States    I-Blocklist  http://list.iblocklist.com/?list=us                    src,dst"
List284="Uruguay          I-Blocklist  http://list.iblocklist.com/?list=uy                    src,dst"
List285="Uzbekistan       I-Blocklist  http://list.iblocklist.com/?list=uz                    src,dst"
List286="Vanuatu          I-Blocklist  http://list.iblocklist.com/?list=vu                    src,dst"
List287="Vatican-City     I-Blocklist  http://list.iblocklist.com/?list=va                    src,dst"
List288="Venezuela        I-Blocklist  http://list.iblocklist.com/?list=ve                    src,dst"
List289="Vietnam          I-Blocklist  http://list.iblocklist.com/?list=vn                    src,dst"
List290="Virgin-Ils-BR    I-Blocklist  http://list.iblocklist.com/?list=vg                    src,dst"
List291="Virgin-Ils-US    I-Blocklist  http://list.iblocklist.com/?list=vi                    src,dst"
List292="WallisFutuna     I-Blocklist  http://list.iblocklist.com/?list=wf                    src,dst"
List293="Yemen            I-Blocklist  http://list.iblocklist.com/?list=ye                    src,dst"
List294="Zambia           I-Blocklist  http://list.iblocklist.com/?list=zm                    src,dst"
List295="Zimbabwe         I-Blocklist  http://list.iblocklist.com/?list=zw                    src,dst"

# Block traffic from any of the above lists
BLOCKLIST_INDEXES="13 15 17 10" # Can be any combination of above list indexes, e.g "38 13", "1", "7 24 8 29 31" etc. [Example: PeerGuardian implementation would be "2 11"]

# Allow traffic from any of the above lists [!]
ALLOWLIST_INDEXES="" # Can be any combination of above list indexes, just like BLOCKLIST_INDEXES

# Your favorite domain blocked after your chosen blocklist(s) are active? You can (optionally) specify domains to whitelist in a local file
WHITELIST_DOMAINS_FILE="/jffs/ipset_lists/whitelist-domains.txt" # One line per domain, comments (starting with the '#' character) allowed, even inline comments
WHITELIST_DOMAINS_TRAFFIC="src,dst" # [src|dst|src,dst] Use [src] to allow inbound traffic, [dst] to allow outbound traffic and [src,dst] to allow both traffic

# You can also force some domains to be blacklisted in a local file (optional)
# You can use the blacklist at [https://github.com/shounak-de/iblocklist-loader/blob/master/blacklist-domains.txt] as is
# to block Microsoft telemetry, Shodan and Project 25499 scanners, and then then add your own (if needed)
BLACKLIST_DOMAINS_FILE="/jffs/ipset_lists/blacklist-domains.txt" # One line per domain, comments (starting with the '#' character) allowed, even inline comments
BLACKLIST_DOMAINS_TRAFFIC="src,dst" # [src|dst|src,dst] Use [src] to block inbound traffic, [dst] to block outbound traffic and [src,dst] to block both traffic

# You should always have a WHITELIST_CIDR_FILE defined and present to stop the downloaded ipset data attempting to block your internal LAN IPs. You may *append* to this list to  this list (if you want, but totally optional) to whitelist other CIDR ranges.
WHITELIST_CIDRS_FILE="/jffs/ipset_lists/whitelist-cidrs.txt" # One line per CIDR entry, comments (starting with the '#' character) allowed, even inline comments
WHITELIST_CIDRS_TRAFFIC="src,dst" # [src|dst|src,dst] Use [src] to allow inbound traffic, [dst] to allow outbound traffic and [src,dst] to allow both traffic

# You can also manually add some CIDR ranges to be blacklisted in a local file (optional)
BLACKLIST_CIDRS_FILE="/jffs/ipset_lists/blacklist-cidrs.txt" # One line per domain, comments (starting with the '#' character) allowed, even inline comments
BLACKLIST_CIDRS_TRAFFIC="src,dst" # [src|dst|src,dst] Use [src] to block inbound traffic, [dst] to block outbound traffic and [src,dst] to block both traffic

# Note: You can also control the inboud/outbound/both traffic for each of the lists: Just modify the [Traffic] column (the last one) in each list

################################## [[[ IMPORTANT ]]] ####################################
# Processing order of block list, allow list, whitelist domains and blacklist domains:  #
# Network traffic be filtered in this order in iptables PREROUTING chain in raw table:  #
# [1] Traffic to/from whitelisted domains in the WHITELIST_DOMAINS_FILE (if specified)  # <= Traffic will be allowed through the firewall
# [2] Traffic to/from blacklisted domains in the BLACKLIST_DOMAINS_FILE (if specified)  # <= Traffic will be blocked on the firewall
# [3] Traffic to/from whitelisted domains in the WHITELIST_CIDR_FILE (private IP ranges)# <= Traffic will be allowed through the firewall
# [4] Traffic to/from blacklisted domains in the BLACKLIST_CIDR_FILE (if specified)     # <= Traffic will be blocked on the firewall
# [5] Traffic to/from lists referenced in the ALLOWLIST_INDEXES (if specified)          # <= Traffic will be allowed through the firewall
# [6] Traffic to/from lists referenced in the BLOCKLIST_INDEXES (if specified)          # <= Traffic will be blocked on the firewall
# [7] Your existing iptables PREROUTING rules (raw table).                              #
#########################################################################################

# Use locally cached ipset data or download on each run
USE_LOCAL_CACHE=Y # [Y|N]

# Re-download list data if locally saved files are older than this many days [Needed mostly for USE_LOCAL_CACHE=Y]
LISTS_SAVE_DAYS=10

# Use DROP or REJECT target for iptables block rule. Briefly, for DROP, attacker (or IP being blocked) will get no response and timeout,
# and REJECT will send immediate response of destination-unreachable (Attacker will know your IP is actively rejecting requests)
# See: http://www.chiark.greenend.org.uk/~peterb/network/drop-vs-reject and http://serverfault.com/questions/157375/reject-vs-drop-when-using-iptables
# or from our own RMerlin: https://www.snbforums.com/threads/ip-tables-confusion.30373/#post-237738
IPTABLES_BLOCK_TARGET=DROP # [DROP|REJECT]

# Folder to cache downloaded files [Needed for USE_LOCAL_CACHE=Y or storing the file for posterity]
IPSET_LISTS_DIR=/jffs/ipset_lists

# *** No settings to modify from here on down ***
[ -d "$IPSET_LISTS_DIR" ] || mkdir -p $IPSET_LISTS_DIR

GetListDetails () {
  i=$1
  [ ${#i} -eq 1 ] && i="00${i}"
  [ ${#i} -eq 2 ] && i="0${i}"
  SetName=$(eval echo \$$(eval echo List${i}) | awk '{ print toupper(substr($2,1,1)) substr($2,2) toupper(substr($1,1,1)) substr($1,2) }')
  Url=$(eval echo \$$(eval echo List${i}) | awk '{ print $3 }')
  Traffic=$(eval echo \$$(eval echo List${i}) | awk '{ print $4 }')
  [ ! -s "$IPSET_LISTS_DIR/${SetName}.gz" -o -n "$(find $IPSET_LISTS_DIR/${SetName}.gz -mtime +$LISTS_SAVE_DAYS -print 2>/dev/null)" ] && wget -q -O $IPSET_LISTS_DIR/${SetName}.gz ${Url}
  [ "$USE_LOCAL_CACHE" = "Y" ] && GetCommand="cat $IPSET_LISTS_DIR/${SetName}.gz" || GetCommand="wget -q -O - \"${Url}\""
}

# If the script is run from console, then print to console what it is doing at the moment (and also log to syslog)
# If run from cron, just write to syslog (no console output)
Log () {
  Message="$1"
  # Determine if the script is run interactively or via cron
  [ ! -t 1 ] || echo "$(basename $0): $Message"
  logger -t Firewall "$(basename $0): $Message"
}

# Wait if this is run early on (before the router has internet connectivity) [Needed by wget to download files]
while ! ping -q -c 1 google.com &>/dev/null; do
  sleep 1
  WaitSeconds=$((WaitSeconds+1))
  [ $WaitSeconds -gt 300 ] && Log "Router not online: attempting to use cached files if they exist" && USE_LOCAL_CACHE=Y
done

# Different routers got different iptables and ipset syntax, also ipset v6.x did away with iptreemap.
# That resulted in a totally different way of parsing the large IP ranges, (hash:ip cannot handle large sets of sometimes 8M+ IPs)
# For ipset v6.x, the script converts IP ranges to CIDR. It creates 2 sets: One for single IPs, and one for CIDRs.
# For ipset v4.x, the original implementaion of using iptreemap is retained.
case $(ipset -v | grep -o "v[4,6]") in
  v6)
  # Loading ipset modules
  lsmod | grep -q "xt_set" || \
  for module in ip_set ip_set_hash_net ip_set_hash_ip xt_set; do
    modprobe $module
  done;
  MATCH_SET='--match-set'; CREATE='create'; DESTROY='destroy'; ADD='add'; IPHASH='hash:ip'; NETHASH='hash:net'
  ipset destroy tIP 2>/dev/null; ipset destroy tNet 2>/dev/null # Recover if previous run aborted
  for processType in BLOCK ALLOW; do
    [ "$processType" = "BLOCK" ] && PROCESS_RULES_TARGET=$IPTABLES_BLOCK_TARGET || PROCESS_RULES_TARGET=ACCEPT
    for index in $(eval echo \$$(eval echo ${processType}LIST_INDEXES)); do
      GetListDetails $index
      # Create the sets if they do not exist
      $(ipset swap ${SetName}Single ${SetName}Single 2>&1 | grep -q "name does not exist") && ipset n ${SetName}Single hash:ip hashsize 2048 maxelem 1048576
      $(ipset swap ${SetName}CIDR ${SetName}CIDR 2>&1 | grep -q "name does not exist") && ipset n ${SetName}CIDR hash:net hashsize 4096 maxelem 4194304

      if ! $(iptables-save | grep -q ${SetName}) || [ "$USE_LOCAL_CACHE" = "N" ]; then
        Log "Started processing ${SetName} $(echo $processType | tr '[A-Z]' '[a-z]')list"
        ( echo -e "n tIP -exist hash:ip hashsize 2048 maxelem 1048576\nn tNet -exist hash:net hashsize 4096 maxelem 4194304"
          eval $GetCommand | gunzip | sed -n '/0.0.0.0/d;s/^.*://p' | \
          nice -n 15 awk '
          # convert dotted quads to long decimal ip. Ex: int ip2dec("192.168.0.15")
          function ip2dec(ip, slice) {
            split(ip, slice, ".")
            return (slice[1] * 2^24) + (slice[2] * 2^16) + (slice[3] * 2^8) + slice[4]
          }
          # convert decimal long ip to dotted quads. Ex: str dec2ip(1171259392)
          function dec2ip(dec, ip, quad) {
            for (i=3; i>=1; i--) { quad = 256^i; ip = ip int(dec/quad) "."; dec = dec%quad }
            return ip dec
          }
          # convert ip ranges to CIDR notation. Ex: str range2cidr(ip2dec("192.168.0.15"), ip2dec("192.168.5.115"))
          function range2cidr(ipStart, ipEnd,  bits, mask, newip) {
            bits = 1; mask = 1
            while (bits < 32) {
              newip = or(ipStart, mask)
              if ((newip>ipEnd) || ((lshift(rshift(ipStart,bits),bits)) != ipStart)) { bits--; mask = rshift(mask,1); break }
              bits++; mask = lshift(mask,1)+1
            }
            newip = or(ipStart, mask); bits = 32 - bits
            # ipset cannot handle single IP via /32 [https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=583079]
            if (bits==32) return "add tIP " dec2ip(ipStart)
            else result = dec2ip(ipStart) "/" bits
            if (newip < ipEnd) result = result "\n" range2cidr(newip + 1, ipEnd)
            return "add tNet " result
          }
          BEGIN { FS="-" }
          $1==$2 { print "add tIP " $1 }
          $1!=$2 { print range2cidr(ip2dec($1), ip2dec($2)) }
          '
        ) > /tmp/${SetName}.txt
        (grep " tIP " /tmp/${SetName}.txt; echo "COMMIT") | nice -n 15 ipset restore
        (grep " tNet " /tmp/${SetName}.txt; echo "COMMIT") | nice -n 15 ipset restore
        rm -f /tmp/${SetName}.txt
        ipset swap tIP ${SetName}Single
        ipset swap tNet ${SetName}CIDR
        ipset destroy tIP; ipset destroy tNet
        Log "Loaded ${SetName}Single $(echo $processType | tr '[A-Z]' '[a-z]')list with $(ipset -L ${SetName}Single | wc -l | awk '{print $1-7}') entries"
        Log "Loaded ${SetName}CIDR $(echo $processType | tr '[A-Z]' '[a-z]')list with $(ipset -L ${SetName}CIDR | wc -l | awk '{print $1-7}') entries"
      else
        iptables -D PREROUTING -t raw -m set --match-set ${SetName}Single $Traffic -j $PROCESS_RULES_TARGET
        iptables -D PREROUTING -t raw -m set --match-set ${SetName}CIDR $Traffic -j $PROCESS_RULES_TARGET
        Log "Skipped loading ${SetName} $(echo $processType | tr '[A-Z]' '[a-z]')lists as they are already loaded. To force reloading, set USE_LOCAL_CACHE=N"
      fi
      iptables -I PREROUTING -t raw -m set --match-set ${SetName}Single $Traffic -j $PROCESS_RULES_TARGET
      iptables -I PREROUTING -t raw -m set --match-set ${SetName}CIDR $Traffic -j $PROCESS_RULES_TARGET
    done
  done;;
  v4)
  # Loading ipset modules
  lsmod | grep -q "ipt_set" || \
  for module in ip_set ip_set_iptreemap ipt_set; do
    modprobe $module
  done;
  MATCH_SET='--set'; CREATE='--create'; DESTROY='--destroy'; ADD='--add'; IPHASH='iphash'; NETHASH='nethash'
  ipset --destroy iBTmp 2>/dev/null # Recover if previous run aborted
  for processType in BLOCK ALLOW; do
    [ "$processType" = "BLOCK" ] && PROCESS_RULES_TARGET=$IPTABLES_BLOCK_TARGET || PROCESS_RULES_TARGET=ACCEPT
    for index in $(eval echo \$$(eval echo ${processType}LIST_INDEXES)); do
      GetListDetails $index
      # Create the set if it does not exist
      $(ipset --swap ${SetName} ${SetName} 2>&1 | grep -q "Unknown set") && ipset -N ${SetName} iptreemap

      if ! $(iptables-save | grep -q ${SetName}) || [ "$USE_LOCAL_CACHE" = "N" ]; then
        Log "Started processing ${SetName} $(echo $processType | tr '[A-Z]' '[a-z]')list"
        ( echo "-N iBTmp iptreemap"
          eval $GetCommand | gunzip | nice -n 15 sed -n '/0.0.0.0/d;s/^.*:/-A iBTmp /p'
          echo -e "COMMIT"
        ) | nice -n 15 ipset --restore
        ipset --swap iBTmp ${SetName}
        ipset --destroy iBTmp
        Log "Loaded ${SetName} $(echo $processType | tr '[A-Z]' '[a-z]')list with $(ipset -L ${SetName} | wc -l | awk '{print $1-6}') entries"
      else
        iptables -D PREROUTING -t raw -m set --set ${SetName} $Traffic -j $PROCESS_RULES_TARGET
        Log "Skipped loading ${SetName} $(echo $processType | tr '[A-Z]' '[a-z]')list as it's already loaded. To force reloading, set USE_LOCAL_CACHE=N"
      fi
      iptables -I PREROUTING -t raw -m set --set ${SetName} $Traffic -j $PROCESS_RULES_TARGET
    done
  done;;
  *)
  Log "Unknown ipset version. Exiting."
  exit 1;;
esac
[ ! -s $WHITELIST_CIDRS_FILE ] && curl -sk "https://raw.githubusercontent.com/shounak-de/iblocklist-loader/master/whitelist-cidrs.txt" -o $WHITELIST_CIDRS_FILE
for CIDRs in BLACK WHITE; do
  if [ -s "$(eval echo \$$(eval echo ${CIDRs}LIST_CIDRS_FILE))" ]; then
    [ "$CIDRs" = "BLACK" ] && PROCESS_RULES_TARGET=$IPTABLES_BLOCK_TARGET || PROCESS_RULES_TARGET=ACCEPT
    IPSET_LIST="${CIDRs:0:1}$(echo ${CIDRs:1} | tr '[A-Z]' '[a-z]')listCIDRs"
    iptables-save | grep -q $IPSET_LIST && iptables -D PREROUTING -t raw -m set $MATCH_SET $IPSET_LIST $(eval echo \$$(eval echo ${CIDRs}LIST_CIDRS_TRAFFIC)) -j $PROCESS_RULES_TARGET
    ipset $DESTROY $IPSET_LIST &>/dev/null # Destroy *if* existing (It will exist if this script is run more than once, e.g. scheduled in cron)
    ipset $CREATE $IPSET_LIST $NETHASH
    [ $? -eq 0 ] && entryCount=0
    while read line; do
      if [ -n "${line%%#*}" ]; then
        for cidr in ${line%%#*}; do
          ipset -q $ADD $IPSET_LIST $cidr
          [ $? -eq 0 ] && entryCount=$((entryCount+1))
        done
      fi
    done <$(eval echo \$$(eval echo ${CIDRs}LIST_CIDRS_FILE))
    Log "Added $IPSET_LIST ($entryCount entries)"
    iptables-save | grep -q $IPSET_LIST || iptables -I PREROUTING -t raw -m set $MATCH_SET $IPSET_LIST $(eval echo \$$(eval echo ${CIDRs}LIST_CIDRS_TRAFFIC)) -j $PROCESS_RULES_TARGET
  fi
done
for domainsFile in BLACK WHITE; do
  if [ -s "$(eval echo \$$(eval echo ${domainsFile}LIST_DOMAINS_FILE))" ]; then
    [ "$domainsFile" = "BLACK" ] && PROCESS_RULES_TARGET=$IPTABLES_BLOCK_TARGET || PROCESS_RULES_TARGET=ACCEPT
    IPSET_LIST="${domainsFile:0:1}$(echo ${domainsFile:1} | tr '[A-Z]' '[a-z]')listDomains"
    iptables-save | grep -q $IPSET_LIST && iptables -D PREROUTING -t raw -m set $MATCH_SET $IPSET_LIST $(eval echo \$$(eval echo ${domainsFile}LIST_DOMAINS_TRAFFIC)) -j $PROCESS_RULES_TARGET
    ipset $DESTROY $IPSET_LIST &>/dev/null # Destroy *if* existing (It will exist if this script is run more than once, e.g. scheduled in cron)
    ipset $CREATE $IPSET_LIST $IPHASH
    [ $? -eq 0 ] && entryCount=0
    while read line; do
      if [ -n "${line%%#*}" ]; then
        for ip in $(nslookup ${line%%#*} | sed -n '/^$/,$ s/^A.*: //p' | cut -d' ' -f1 | grep -v ":"); do
          ipset -q $ADD $IPSET_LIST $ip
          [ $? -eq 0 ] && entryCount=$((entryCount+1))
        done
      fi
    done <$(eval echo \$$(eval echo ${domainsFile}LIST_DOMAINS_FILE))
    Log "Added $IPSET_LIST ($entryCount entries)"
    iptables-save | grep -q $IPSET_LIST || iptables -I PREROUTING -t raw -m set $MATCH_SET $IPSET_LIST $(eval echo \$$(eval echo ${domainsFile}LIST_DOMAINS_TRAFFIC)) -j $PROCESS_RULES_TARGET
  fi
done
