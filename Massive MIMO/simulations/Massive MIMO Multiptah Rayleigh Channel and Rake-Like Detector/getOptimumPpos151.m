function [ppos151, flag_data_min] = getOptimumPpos151()

ppos151 = [6 13 15 25 53 73 91 102 103 108 131 134 182 192 208 210 231 233 235 238 254 307 324 337 370 387 419 427 430 435 437 440 454 482 484 493 505 508 510 515 516 533 541 542 544 591 618 658 689 700 704 714 724 727 729 736 763 779 780 829 830 834 838 858 871 905 908 911 927 933 935 945 953 984 1022 1029 1043 1102 1104 1119 1144 1183 1186 1196 1200 1201 1202 1228 1231 1254 1275 1284 1306 1346 1351 1364 1374 1377 1384 1396 1431 1452 1495 1506 1523 1528 1552 1561 1565 1588 1595 1607 1621 1642 1644 1647 1680 1681 1716 1736 1761 1802 1806 1807 1809 1824 1851 1854 1859 1861 1862 1869 1873 1890 1910 1916 1921 1936 1939 1942 1944 1950 1968 1977 1992 1998 2018 2019 2023 2035 2041;34 46 121 126 132 147 149 153 163 189 207 214 237 246 247 258 261 276 315 319 381 382 396 411 420 470 477 480 503 514 532 549 559 560 563 579 601 623 659 690 692 703 707 711 725 751 793 798 837 867 876 883 885 890 894 899 906 926 941 955 960 982 1000 1013 1027 1051 1052 1054 1065 1067 1074 1078 1089 1096 1100 1103 1123 1145 1173 1174 1189 1193 1195 1212 1215 1219 1234 1278 1293 1299 1302 1307 1310 1318 1341 1342 1359 1360 1376 1381 1387 1391 1412 1428 1436 1478 1480 1488 1491 1492 1497 1508 1511 1513 1550 1617 1637 1638 1646 1660 1682 1684 1702 1704 1710 1726 1733 1751 1752 1793 1799 1817 1829 1893 1897 1904 1912 1938 1951 1953 1966 1973 1982 1986 2003 2004 2005 2022 2029 2034 2043;24 37 43 47 67 68 71 80 90 99 100 135 168 176 199 226 232 248 275 310 342 357 359 368 392 402 405 407 418 421 423 425 426 439 462 465 490 496 537 540 543 593 598 600 606 624 632 715 733 743 746 756 765 785 786 802 810 841 848 868 872 904 913 977 980 1015 1028 1032 1036 1038 1041 1063 1077 1127 1134 1142 1143 1164 1165 1170 1181 1229 1230 1232 1236 1239 1240 1260 1265 1281 1288 1298 1304 1329 1371 1375 1400 1402 1410 1417 1425 1433 1439 1458 1459 1461 1466 1476 1477 1482 1507 1556 1557 1569 1575 1596 1602 1605 1641 1645 1649 1661 1662 1665 1673 1675 1690 1719 1728 1758 1767 1768 1780 1781 1792 1812 1823 1835 1845 1846 1855 1868 1877 1882 1907 1929 1940 1955 1964 1996 2010;8 32 49 51 52 64 86 89 93 107 111 128 144 150 173 183 203 215 218 219 244 280 286 296 297 299 301 317 328 341 351 375 378 383 398 441 446 457 461 469 491 498 512 525 526 530 536 556 585 588 603 619 646 651 655 662 698 708 710 712 760 801 806 820 842 853 864 870 873 922 929 958 961 979 1002 1003 1007 1045 1053 1094 1099 1106 1111 1118 1130 1131 1132 1159 1160 1161 1169 1171 1190 1199 1204 1217 1245 1263 1268 1316 1333 1343 1380 1390 1406 1411 1414 1415 1418 1422 1437 1441 1456 1469 1502 1572 1573 1574 1580 1594 1601 1609 1612 1619 1623 1626 1635 1650 1664 1698 1703 1735 1740 1757 1773 1774 1775 1776 1779 1782 1805 1886 1900 1908 1928 1954 1956 2001 2011 2013 2036;16 18 27 29 59 79 109 117 143 151 152 154 161 174 177 242 249 257 274 309 312 343 409 433 449 456 463 475 476 553 561 578 594 607 611 616 628 642 643 677 693 717 726 738 755 771 772 776 787 799 807 817 822 839 843 849 857 878 910 934 940 947 952 959 972 976 991 994 1011 1025 1037 1039 1049 1079 1082 1095 1107 1108 1109 1110 1120 1122 1137 1139 1141 1149 1182 1213 1223 1235 1253 1256 1271 1274 1289 1292 1314 1323 1395 1405 1409 1419 1421 1430 1442 1473 1504 1505 1514 1515 1518 1537 1539 1548 1566 1582 1587 1598 1600 1603 1606 1608 1640 1659 1668 1671 1672 1685 1697 1713 1731 1739 1744 1745 1753 1766 1787 1797 1813 1825 1879 1881 1974 1985 1993 1997 2006 2026 2032 2033 2042;11 12 21 26 55 69 70 72 87 97 98 114 155 172 179 181 186 196 220 229 240 241 253 273 287 311 316 326 339 340 347 350 353 379 380 388 400 410 414 443 458 459 471 489 518 519 550 558 562 564 566 569 576 589 592 614 656 665 672 683 685 713 718 734 735 742 764 811 816 819 821 833 840 859 865 903 920 921 965 975 988 989 1009 1012 1034 1048 1059 1062 1084 1105 1114 1155 1188 1216 1244 1250 1255 1257 1258 1272 1277 1282 1285 1295 1296 1326 1330 1347 1355 1389 1462 1465 1467 1484 1500 1516 1520 1531 1551 1559 1564 1581 1592 1624 1630 1688 1692 1721 1732 1742 1788 1789 1795 1801 1827 1843 1848 1865 1876 1891 1905 1918 1927 1952 1980 2025 2027 2028 2030 2038 2040;3 10 45 62 63 96 104 136 178 187 193 212 224 225 239 245 264 265 272 281 284 288 305 306 333 346 352 354 358 377 385 395 403 406 412 431 436 464 466 478 483 492 554 555 565 568 583 597 640 641 650 657 664 676 686 709 739 741 749 781 783 789 800 809 832 852 854 862 877 886 896 898 902 918 924 930 990 992 999 1005 1026 1064 1075 1085 1087 1091 1101 1147 1166 1172 1197 1225 1243 1276 1291 1321 1327 1339 1344 1350 1370 1386 1394 1398 1408 1426 1449 1451 1501 1510 1522 1524 1538 1563 1568 1571 1576 1583 1589 1591 1604 1632 1643 1651 1652 1656 1666 1679 1694 1711 1724 1746 1778 1790 1794 1820 1837 1840 1847 1849 1884 1896 1923 1935 1948 1969 1970 1976 1994 2020 2024;23 31 41 65 110 137 159 171 197 211 216 217 228 243 255 262 270 277 291 295 303 344 348 373 391 399 445 467 468 474 481 494 520 539 571 580 582 590 599 615 647 652 663 671 680 681 688 701 719 723 728 752 757 773 774 803 804 824 831 844 845 850 851 869 882 884 891 892 893 912 919 923 936 937 944 956 963 964 986 1072 1092 1115 1146 1148 1152 1157 1158 1198 1203 1205 1227 1247 1273 1280 1290 1313 1362 1366 1372 1383 1392 1404 1429 1432 1468 1470 1503 1525 1542 1543 1547 1558 1590 1597 1628 1686 1693 1699 1705 1712 1714 1717 1738 1747 1748 1760 1764 1771 1796 1808 1811 1821 1828 1833 1838 1852 1866 1885 1887 1895 1899 1914 1915 1949 1958 1971 1979 1981 1990 2017 2047;35 36 40 54 78 84 92 118 119 123 129 146 148 170 190 201 205 221 252 266 292 298 308 327 334 335 336 338 345 365 371 404 434 485 487 502 506 513 517 523 527 534 552 573 595 605 622 629 633 661 666 697 730 750 759 766 777 795 796 827 860 895 907 925 928 932 968 978 1006 1014 1023 1056 1057 1058 1060 1068 1113 1128 1136 1151 1156 1163 1180 1187 1191 1206 1220 1241 1242 1249 1252 1262 1266 1270 1279 1301 1311 1312 1315 1317 1322 1324 1328 1331 1335 1352 1369 1373 1413 1440 1454 1460 1472 1485 1517 1549 1567 1578 1636 1653 1657 1706 1707 1727 1729 1730 1749 1750 1765 1777 1786 1798 1814 1815 1826 1875 1878 1888 1894 1898 1920 1926 1930 1932 1959 1961 1963 1989 2009 2016 2021;14 22 57 61 74 75 82 83 115 130 167 188 191 213 256 268 271 293 331 349 355 364 389 413 424 444 450 453 472 473 499 504 524 529 548 557 577 586 608 612 625 668 675 679 684 694 702 737 768 769 782 790 792 797 813 815 828 866 887 888 900 901 943 948 950 951 957 985 996 998 1001 1033 1040 1069 1070 1086 1133 1175 1207 1208 1211 1237 1269 1286 1287 1297 1308 1320 1334 1336 1338 1340 1345 1353 1363 1365 1367 1378 1379 1385 1403 1424 1435 1446 1447 1448 1450 1471 1481 1493 1533 1534 1540 1544 1554 1555 1577 1593 1616 1627 1648 1654 1655 1663 1677 1687 1709 1720 1741 1762 1783 1784 1832 1841 1844 1857 1863 1872 1906 1911 1933 1937 1943 1945 1967 1984 1987 1988 1999 2037 2039];

load('flag_dataK10_Np151.mat');