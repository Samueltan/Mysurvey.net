<%@ Page Language="C#" AutoEventWireup="true" CodeFile="charts.aspx.cs" Inherits="charts" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="language" content="en" />

        <!--======== CSS FRAMEWORK ========-->
    <link rel="stylesheet" type="text/css" href="static/css/print.css" media="print" />
    <link rel="stylesheet" type="text/css" href="static/css/main.css" />
    <script type="text/javascript" src="static/js/jquery.min.js"></script>
    <script type="text/javascript" src="static/js/jquery.js"></script>
    <script type="text/javascript" src="static/js/jquery.yiiactiveform.js"></script>
    <script type="text/javascript" src="static/js/ui.js"></script>

    <script src="static/js/jQury191.min.js" type="text/javascript"></script>
    <script src="static/js/Highcharts.js" type="text/javascript"></script>
    <script src="static/highcharts/js/modules/exporting.js" type="text/javascript"></script>
    <script src="static/highcharts/js/highcharts.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(function () {
            $('#container1').highcharts({
                chart: {
                    type: 'pie',
                    name: 'Browser share',
                    plotBackgroundColor: null,
                    plotBorderWidth: null,
                    plotShadow: false
                },
                title: {
                    text: 'Total Survey Numbers'
                },
                tooltip: {
                    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                },
                plotOptions: {
                    pie: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: {
                            enabled: true,
                            format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                            style: {
                                color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                            }
                        }
                    }
                },
                //series: [{ data: [  ['unpublished survey', 2], ['published survey',2] ]
                //}]
                series: <%= seriesData.ToString() %> //此处数据从后台获取
                });

            $('#container2').highcharts({
                chart: {
                    renderTo: 'container',
                    defaultSeriesType: 'column', //图表类型 line, spline, area, areaspline, column, bar, pie , column，scatter  
                    inverted: true //左右显示，默认上下正向。假如设置为true，则横纵坐标调换位置  
                },
                xAxis: {
                    categories: ['q1', 'q2', 'q3', 'q4', 'q5', 'q6'],//X轴的坐标值  
                    title: { text: 'Question Items' } //Y轴坐标标题  labels:纵柱标尺  
                },

                yAxis: {
                    title: { text: 'Cumulation of Answers' },  //Y轴坐标标题  labels:纵柱标尺  
                    min: 0
                },
                tooltip: {
                    formatter: function () {
                        //当鼠标悬置数据点时的格式化提示  
                        return Highcharts.numberFormat(this.y, 1) + ' subjects choose this answer ' + this.series.name + ' <br/>of question:' + this.x;
                    }
                },

                credits: {
                    enabled: true
                },
                plotOptions: {
                    bar:{
                        dataLabels: {
                            enabled: true,//是否在点的旁边显示数据    
                            format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                        },
                        enableMouseTracking: true,//鼠标移到图表上时是否显示提示框    
                    }
                },
                legend: {
                    layout: 'vertical',
                    align: 'right',
                    verticalAlign: 'top',
                    x: -10,
                    y: 100,
                    floating: true,
                    borderWidth: 1,
                    backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor || '#FFFFFF'),
                    shadow: true
                },
                title: { text: 'Result of survey 5' }, //图表主标题  
                subtitle: { text: '' }, //图表副标题  
                //series: [{
                //    name: 'a/true', data: [10, 10, 10, 10, 0, 0]
                //},{
                //    name: 'b/false', data:[10 ,10, 10, 0, 0 ,0 ]
                //}, {
                //    name: 'c', data:      [0 ,10 , 0 , 10,20,  0,]            
                //}]
                series: [{
                    name: '"a"', data: [35, 17, 10, 30, 20, 0]
                }, {
                    name: '"b"', data: [10, 43, 35, 20, 0, 0]
                }, {
                    name: '"c"', data: [10, 10, 0, 10, 20, 0, ]
                }]

            });
        });
     

    </script>



    <title>MySurvey - Update Survey</title>
</head>

<body>
    <!--======== PAGE ========-->
    <div class="container" id="page">
        <form id="form1" runat="server">
        <!--======== HEADER ========-->
        <div id="header">
            <div class="content-area">
                <a href="http://localhost:8089/mySurvey/mySurvey_app/survey">
                    <div id="logo-container">
                        <img id="headerLogo" src="static/img/logo-white.png" /></div>
                </a>
                <div id="logout" Style="width: auto; position: relative; float: right; margin-top: 2px;">
                        <asp:Label ID="usermail" runat="server" Text="Label" >   </asp:Label>                    
                        <asp:Button ID="btnlogout" runat="server" Text="Logout" OnClick="btnlogout_Click" Style="background: #005a82; color: #fff; text-decoration: none; padding: 8px 20px; font-size: 12px; border-radius: 10px; font-weight: 700; border: 2px solid #c8e2ea; margin-left: 15px;" />
                    </div>
                <!-- logout -->
            </div>
        </div>
        <!-- header -->
        <!--======== MENU + MAIN CONTENT AREA ========-->
        <div class="content-area">


            <!--======== MENU ========-->
            <div id="mainmenu">
                <ul id="yw0">
                    <li><a href="Homepage.aspx">Surveys</a></li>
                    <li><a href="charts.aspx">Reports</a></li>
                    <li><a href="http://localhost:8089/mySurvey/mySurvey_app/site/settings">Account Settings</a></li>
                </ul>
            </div>
            <!-- mainmenu -->
            
                <div>
                    <div id="container1" style="width: 800px; height: 400px; margin: 0 auto">
                    </div>
                    <div id="container2" style="width: 800px; height: 400px; margin: 0 auto">
                    </div>
                </div>
            
            </div>
            </form>
        </div>
            <script type="text/javascript" src="static/js/jquery-ui.min.js"></script>
            <script type="text/javascript" src="static/js/functions.js"></script>
            <script type="text/javascript" src="static/js/survey_update.js"></script>
         
</body>
</html>
