# encoding: utf-8
class Chart
  def self.basic_line_chart
    @chart = LazyHighCharts::HighChart.new('basic_line') do |f|
      f.chart({ type: 'line',
                marginRight: 130,
                marginBottom: 25 })
      f.title({  text: 'Monthly Average Temperature',
                 x: -20
      })
      f.xAxis({
         categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                          'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
      })
      f.yAxis({
        title: {
          text: 'Temperature (°C)'
        },
        plotLines: [{
          value: 0,
          width: 1,
          color: '#808080'
        }]
      })
      f.tooltip({
        valueSuffix: '°C'
      })
      f.legend({
        layout: 'vertical',
        align: 'right',
        verticalAlign: 'top',
        x: -10,
        y: 100,
        borderWidth: 0
      })
      f.subtitle({
        text: 'Source: WorldClimate.com',
        x: -20
      })
      f.series({
        name: 'Tokyo',
        ldata: [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
      })
      f.series(
        name: 'New York',
        data: [-0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5]
      )
      f.series({
        name: 'Berlin',
        data: [-0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6, 17.9, 14.3, 9.0, 3.9, 1.0]
      })
      f.series({
          name: 'London',
          data: [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]
      })
    end
  end

  #       Ajax loaded data, clickable points
  def self.line_ajax_chart

@csv = <<-EOJS
Day,Visits,Unique Visitors
3/9/13,5691,4346
3/10/13,5403,4112
3/11/13,15574,11356
3/12/13,16211,11876
3/13/13,16427,11966
3/14/13,16486,12086
3/15/13,14737,10916
3/16/13,5838,4507
3/17/13,5542,4202
3/18/13,15560,11523
3/19/13,18940,14431
3/20/13,16970,12599
3/21/13,17580,13094
3/22/13,17511,13234
3/23/13,6601,5213
3/24/13,6158,4806
3/25/13,17353,12639
3/26/13,17660,12768
3/27/13,16921,12389
3/28/13,15964,11686
3/29/13,12028,8891
3/30/13,5835,4513
3/31/13,4799,3661
4/1/13,13037,9503
4/2/13,16976,12666
4/3/13,17100,12635
4/4/13,15701,11394
4/5/13,14378,10530
4/6/13,5889,4521
4/7/13,6779,5109
4/8/13,16068,11599
EOJS

    @chart = LazyHighCharts::HighChart.new('line_ajax') do |f|
      f.title({
        text: 'Daily visits at www.highcharts.com'
      })
      f.subtitle({
        text: 'Source: Google Analytics'
      })
      f.xAxis({
        type: 'datetime',
        tickInterval: 7 * 24 * 3600 * 1000, # one_week
        tickWidth: 0,
          gridLineWidth: 1,
          labels: {
            align: 'left',
            x: 3,
            y: -3
          }
      })
      f.yAxis([{ #// left y axis
                title: {
                  text: nil
                },
                labels: {
                  align: 'left',
                  x: 3,
                  y: 16,
                  formatter: %|function() {
                    return Highcharts.numberFormat(this.value, 0);
                  }|.js_code
                },
                showFirstLabel: false
      },
      { #// right y axis
        linkedTo: 0,
        gridLineWidth: 0,
        opposite: true,
        title: {
          text: nil
        },
        labels: {
          align: 'right',
          x: -3,
          y: 16,
          formatter: %|function() {
            return Highcharts.numberFormat(this.value, 0);
          }|.js_code
        },
        showFirstLabel: false
      }
      ])
      f.legend({
        align: 'left',
        verticalAlign: 'top',
        y: 20,
        floating: true,
        borderWidth: 0
      })
      f.tooltip({
        shared: true,
        crosshairs: true
      })
      f.series({
        name: 'All visits',
        lineWidth: 4,
        marker: {
          radius: 4
        }
      })
      f.series({
        name: 'New visitors'
      })
    end

    @chart.options.merge!({data: {csv: @csv}})

    return @chart
  end


  def self.line_labels_chart
    @chart = LazyHighCharts::HighChart.new('line_labels') do |f|
      f.chart({
         type: 'line'
      })
      f.title({
        text: 'Monthly Average Temperature'
      })
      f.subtitle({
          text: 'Source: WorldClimate.com'
      })
      f.xAxis({
        categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
      })
      f.yAxis({
         title: {
                             text: 'Temperature (°C)'
                         }
      })
      f.tooltip({
        enabled: false,
        formatter: %|function() {
                             return '<b>'+ this.series.name +'</b><br/>'+
                                 this.x +': '+ this.y +'°C';
                         }|.js_code

      })
      f.plotOptions({
         line: {
                             dataLabels: {
                                                     enabled: true
                                                 },
                             enableMouseTracking: false
                         }
      })

      f.series({
         name: 'Tokyo',
         data: [7.0, 6.9, 9.5, 14.5, 18.4, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
      })
      f.series({
          name: 'London',
          data: [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]
      
      })

    end

  end

end
