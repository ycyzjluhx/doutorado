function [ppos60, flag_data_min] = getOptimumPpos60()

ppos60 = [34 50 58 78 138 191 301 305 387 467 468 515 647 698 718 740 745 748 754 793 845 876 960 976 989 1013 1097 1128 1131 1172 1209 1251 1253 1310 1315 1317 1331 1356 1399 1413 1457 1460 1466 1481 1503 1546 1578 1677 1713 1729 1738 1741 1761 1784 1836 1886 1919 1921 1980 1997;22 72 77 112 149 181 201 203 218 276 365 382 403 450 463 516 533 567 689 733 747 756 957 967 975 1070 1080 1084 1117 1120 1186 1264 1289 1316 1381 1397 1430 1453 1479 1511 1515 1539 1553 1593 1625 1647 1700 1703 1709 1739 1744 1751 1807 1868 1905 1961 1962 1993 1999 2036;7 31 61 107 115 174 177 262 329 337 363 367 540 624 642 668 704 726 729 730 760 915 916 927 977 1011 1027 1035 1043 1067 1111 1146 1254 1283 1319 1350 1364 1382 1387 1408 1409 1455 1464 1551 1562 1600 1649 1658 1679 1693 1760 1777 1806 1819 1871 1950 1963 1973 1977 2024;4 19 86 163 168 189 226 233 291 297 350 362 414 437 446 505 514 530 607 628 757 789 809 822 834 853 877 892 899 953 1037 1058 1061 1224 1271 1330 1343 1349 1352 1393 1448 1520 1613 1614 1626 1654 1664 1687 1733 1746 1789 1817 1825 1856 1860 1862 1929 1954 1957 2001;23 97 101 111 180 240 246 273 342 390 455 510 522 548 550 556 557 561 564 597 612 629 677 784 894 942 1018 1031 1032 1048 1071 1073 1148 1184 1191 1192 1203 1299 1333 1336 1482 1498 1526 1572 1661 1663 1665 1750 1754 1790 1809 1812 1893 1944 1976 1981 1982 2032 2041 2044;1 13 28 59 64 114 119 162 193 215 225 232 235 284 299 330 353 384 400 485 532 595 604 620 652 717 722 781 806 835 840 1009 1010 1135 1147 1150 1176 1247 1337 1423 1445 1486 1519 1527 1544 1550 1560 1632 1670 1685 1748 1782 1783 1824 1830 1833 1855 1866 1964 2016;51 141 143 148 213 261 280 310 315 356 405 435 438 441 507 513 523 545 570 608 619 646 674 708 746 762 769 868 878 884 906 963 993 995 1025 1049 1108 1175 1228 1258 1300 1309 1321 1327 1391 1559 1575 1599 1602 1604 1707 1726 1737 1758 1847 1857 1873 1885 1946 2020;67 94 117 183 214 247 254 259 270 304 306 316 372 471 478 484 506 508 544 583 590 665 782 786 831 882 921 1019 1064 1081 1091 1099 1217 1232 1250 1266 1372 1418 1434 1461 1470 1556 1596 1651 1671 1672 1673 1678 1742 1757 1779 1796 1870 1882 1895 1896 1901 1934 2012 2045;88 234 236 248 309 412 428 487 497 512 521 547 565 578 591 685 700 753 780 783 792 798 846 858 861 880 909 923 952 956 958 1020 1024 1030 1053 1055 1094 1098 1211 1230 1295 1302 1388 1444 1462 1468 1487 1509 1630 1657 1712 1716 1719 1769 1832 1889 1912 1948 1956 2039;12 45 53 104 125 144 153 158 211 224 272 287 312 321 333 347 425 470 496 566 582 650 659 714 772 818 833 837 885 912 922 985 1006 1029 1090 1198 1218 1307 1308 1325 1340 1412 1420 1425 1449 1452 1471 1480 1500 1552 1557 1569 1624 1686 1845 1864 1888 1891 1915 1998];

load('flag_dataK10_Np60.mat');