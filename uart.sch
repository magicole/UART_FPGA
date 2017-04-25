<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_3" />
        <signal name="XLXN_4" />
        <signal name="XLXN_5" />
        <signal name="XLXN_6" />
        <signal name="clr" />
        <signal name="D_in" />
        <signal name="D_out" />
        <signal name="clk" />
        <signal name="DATA(7:0)" />
        <signal name="DATA(7)" />
        <signal name="DATA(6)" />
        <signal name="DATA(5)" />
        <signal name="DATA(4)" />
        <signal name="DATA(3)" />
        <signal name="DATA(2)" />
        <signal name="DATA(1)" />
        <signal name="DATA(0)" />
        <port polarity="Input" name="clr" />
        <port polarity="Input" name="D_in" />
        <port polarity="Output" name="D_out" />
        <port polarity="Input" name="clk" />
        <port polarity="Output" name="DATA(7)" />
        <port polarity="Output" name="DATA(6)" />
        <port polarity="Output" name="DATA(5)" />
        <port polarity="Output" name="DATA(4)" />
        <port polarity="Output" name="DATA(3)" />
        <port polarity="Output" name="DATA(2)" />
        <port polarity="Output" name="DATA(1)" />
        <port polarity="Output" name="DATA(0)" />
        <blockdef name="clock_divider">
            <timestamp>2017-4-25T1:35:52</timestamp>
            <rect width="256" x="64" y="-64" height="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="Sender">
            <timestamp>2017-4-25T1:35:58</timestamp>
            <rect width="304" x="64" y="-256" height="256" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="432" y1="-224" y2="-224" x1="368" />
            <line x2="432" y1="-32" y2="-32" x1="368" />
        </blockdef>
        <blockdef name="Receiver">
            <timestamp>2017-4-25T1:36:8</timestamp>
            <rect width="304" x="64" y="-256" height="256" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="432" y1="-224" y2="-224" x1="368" />
            <rect width="64" x="368" y="-44" height="24" />
            <line x2="432" y1="-32" y2="-32" x1="368" />
        </blockdef>
        <block symbolname="clock_divider" name="XLXI_1">
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="XLXN_5" name="clk_out" />
        </block>
        <block symbolname="Sender" name="XLXI_2">
            <blockpin signalname="clr" name="clr" />
            <blockpin signalname="XLXN_3" name="XMT_REQ" />
            <blockpin signalname="XLXN_5" name="clk" />
            <blockpin signalname="DATA(7:0)" name="XMT_DATA(7:0)" />
            <blockpin signalname="XLXN_6" name="XMT_ACK" />
            <blockpin signalname="D_out" name="XMT" />
        </block>
        <block symbolname="Receiver" name="XLXI_3">
            <blockpin signalname="clr" name="clr" />
            <blockpin signalname="XLXN_5" name="clk" />
            <blockpin signalname="D_in" name="RCV" />
            <blockpin signalname="XLXN_6" name="RCV_ACK" />
            <blockpin signalname="XLXN_3" name="RCV_REQ" />
            <blockpin signalname="DATA(7:0)" name="RCV_DATA(7:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="2000" y="1168" name="XLXI_2" orien="R0">
        </instance>
        <instance x="784" y="1184" name="XLXI_3" orien="R0">
        </instance>
        <branch name="XLXN_3">
            <wire x2="1600" y1="960" y2="960" x1="1216" />
            <wire x2="1600" y1="960" y2="1008" x1="1600" />
            <wire x2="2000" y1="1008" y2="1008" x1="1600" />
        </branch>
        <instance x="1264" y="800" name="XLXI_1" orien="R0">
        </instance>
        <branch name="XLXN_6">
            <wire x2="784" y1="1152" y2="1152" x1="736" />
            <wire x2="736" y1="1152" y2="1232" x1="736" />
            <wire x2="2512" y1="1232" y2="1232" x1="736" />
            <wire x2="2512" y1="944" y2="944" x1="2432" />
            <wire x2="2512" y1="944" y2="1232" x1="2512" />
        </branch>
        <branch name="clr">
            <wire x2="768" y1="960" y2="960" x1="688" />
            <wire x2="784" y1="960" y2="960" x1="768" />
            <wire x2="768" y1="960" y2="1264" x1="768" />
            <wire x2="1280" y1="1264" y2="1264" x1="768" />
            <wire x2="1280" y1="944" y2="1264" x1="1280" />
            <wire x2="2000" y1="944" y2="944" x1="1280" />
        </branch>
        <branch name="D_in">
            <wire x2="784" y1="1088" y2="1088" x1="656" />
        </branch>
        <branch name="D_out">
            <wire x2="2608" y1="1136" y2="1136" x1="2432" />
        </branch>
        <branch name="clk">
            <wire x2="1264" y1="768" y2="768" x1="1024" />
        </branch>
        <iomarker fontsize="28" x="1024" y="768" name="clk" orien="R180" />
        <iomarker fontsize="28" x="688" y="960" name="clr" orien="R180" />
        <iomarker fontsize="28" x="656" y="1088" name="D_in" orien="R180" />
        <iomarker fontsize="28" x="2608" y="1136" name="D_out" orien="R0" />
        <branch name="DATA(7:0)">
            <wire x2="1328" y1="1152" y2="1152" x1="1216" />
            <wire x2="1328" y1="1088" y2="1152" x1="1328" />
            <wire x2="1392" y1="1088" y2="1088" x1="1328" />
            <wire x2="1424" y1="1088" y2="1088" x1="1392" />
            <wire x2="1456" y1="1088" y2="1088" x1="1424" />
            <wire x2="1488" y1="1088" y2="1088" x1="1456" />
            <wire x2="1520" y1="1088" y2="1088" x1="1488" />
            <wire x2="1552" y1="1088" y2="1088" x1="1520" />
            <wire x2="1584" y1="1088" y2="1088" x1="1552" />
            <wire x2="1616" y1="1088" y2="1088" x1="1584" />
            <wire x2="1824" y1="1088" y2="1088" x1="1616" />
            <wire x2="1824" y1="1088" y2="1136" x1="1824" />
            <wire x2="2000" y1="1136" y2="1136" x1="1824" />
        </branch>
        <branch name="XLXN_5">
            <wire x2="784" y1="1024" y2="1024" x1="720" />
            <wire x2="720" y1="1024" y2="1248" x1="720" />
            <wire x2="1696" y1="1248" y2="1248" x1="720" />
            <wire x2="1696" y1="768" y2="768" x1="1648" />
            <wire x2="1824" y1="768" y2="768" x1="1696" />
            <wire x2="1824" y1="768" y2="1072" x1="1824" />
            <wire x2="2000" y1="1072" y2="1072" x1="1824" />
            <wire x2="1696" y1="768" y2="1248" x1="1696" />
        </branch>
        <bustap x2="1392" y1="1088" y2="1184" x1="1392" />
        <bustap x2="1424" y1="1088" y2="1184" x1="1424" />
        <bustap x2="1456" y1="1088" y2="1184" x1="1456" />
        <bustap x2="1488" y1="1088" y2="1184" x1="1488" />
        <bustap x2="1520" y1="1088" y2="1184" x1="1520" />
        <bustap x2="1552" y1="1088" y2="1184" x1="1552" />
        <bustap x2="1584" y1="1088" y2="1184" x1="1584" />
        <bustap x2="1616" y1="1088" y2="1184" x1="1616" />
        <branch name="DATA(7)">
            <wire x2="1392" y1="1184" y2="1312" x1="1392" />
        </branch>
        <branch name="DATA(6)">
            <wire x2="1424" y1="1184" y2="1488" x1="1424" />
        </branch>
        <branch name="DATA(5)">
            <wire x2="1456" y1="1184" y2="1312" x1="1456" />
        </branch>
        <branch name="DATA(4)">
            <wire x2="1488" y1="1184" y2="1488" x1="1488" />
        </branch>
        <branch name="DATA(3)">
            <wire x2="1520" y1="1184" y2="1312" x1="1520" />
        </branch>
        <branch name="DATA(2)">
            <wire x2="1552" y1="1184" y2="1488" x1="1552" />
        </branch>
        <branch name="DATA(1)">
            <wire x2="1584" y1="1184" y2="1312" x1="1584" />
        </branch>
        <branch name="DATA(0)">
            <wire x2="1616" y1="1184" y2="1488" x1="1616" />
        </branch>
        <iomarker fontsize="28" x="1392" y="1312" name="DATA(7)" orien="R90" />
        <iomarker fontsize="28" x="1456" y="1312" name="DATA(5)" orien="R90" />
        <iomarker fontsize="28" x="1520" y="1312" name="DATA(3)" orien="R90" />
        <iomarker fontsize="28" x="1584" y="1312" name="DATA(1)" orien="R90" />
        <iomarker fontsize="28" x="1424" y="1488" name="DATA(6)" orien="R90" />
        <iomarker fontsize="28" x="1488" y="1488" name="DATA(4)" orien="R90" />
        <iomarker fontsize="28" x="1552" y="1488" name="DATA(2)" orien="R90" />
        <iomarker fontsize="28" x="1616" y="1488" name="DATA(0)" orien="R90" />
    </sheet>
</drawing>