<%--
  Created by IntelliJ IDEA.
  User: 86187
  Date: 2022/6/14
  Time: 15:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title></title>
</head>
<body style="background-color: white">
<canvas id='cavs' style='position:fixed; z-index:-1;'></canvas>
</body>
<script type="text/javascript">
  var canvas = document.getElementById("cavs");
  const WIDTH = window.innerWidth;
  const HEIGHT = window.innerHeight;
  canvas.setAttribute("width", WIDTH);
  canvas.setAttribute("height", HEIGHT);
  var context = canvas.getContext("2d");
  var start =
          {
            loves: [],
            DURATION: 30,
            begin: function()
            {
              this.createLove();
            },
            createLove: function()
            {
              for (var i = 0; i < WIDTH / 59; i++)
              {
                var love = new Love();
                this.loves.push(love);
              }
              setInterval(this.drawLove.bind(this), this.DURATION);
            },
            drawLove: function()
            {
              context.clearRect(0, 0, WIDTH, HEIGHT);
              for (var key in this.loves)
              {
                this.loves[key].draw();
              }
            }
          }
  function Love()
  {
    var me = this;
    function rand()
    {
      me.maxScale = (Math.random() * 3.2 + 1.2) * WIDTH / 521;
      me.curScale = 1.2 * WIDTH / 521;
      me.x = Math.floor(Math.random() * WIDTH - 40);
      me.y = Math.floor(HEIGHT - Math.random() * 200);
      me.ColR = Math.floor(Math.random() * 255);
      me.ColG = Math.floor(Math.random() * 255);
      me.ColB = Math.floor(Math.random() * 255);
      me.alpha = Math.random() * 0.2 + 0.8;
      me.vector = Math.random() * 5 + 0.4;
    }
    (function(){rand();} ());
    me.draw = function()
    {
      if (me.alpha < 0.01) rand();
      if(me.curScale < me.maxScale) me.curScale += 0.3;
      x = me.x;
      y = me.y;
      scale = me.curScale;
      context.fillStyle = "rgba(" + me.ColR + "," + me.ColG + "," + me.ColB + "," + me.alpha + ")";
      context.shadowBlur = 10;
      context.shadowColor = "rgb(" + me.ColR + "," + me.ColG + "," + me.ColB + ")";
      context.beginPath();
      context.bezierCurveTo( x + 2.5*scale, y + 2.5*scale, x + 2.0*scale, y, x, y );
      context.bezierCurveTo( x - 3.0*scale, y, x - 3.0*scale, y + 3.5*scale,x - 3.0*scale,y + 3.5*scale );
      context.bezierCurveTo( x - 3.0*scale, y + 5.5*scale, x - 1.0*scale, y + 7.7*scale, x + 2.5*scale, y + 9.5*scale );
      context.bezierCurveTo( x + 6.0*scale, y + 7.7*scale, x + 8.0*scale, y + 5.5*scale, x + 8.0*scale, y + 3.5*scale );
      context.bezierCurveTo( x + 8.0*scale, y + 3.5*scale, x + 8.0*scale, y, x + 5.0*scale, y );
      context.bezierCurveTo( x + 3.5*scale, y, x + 2.5*scale, y + 2.5*scale, x + 2.5*scale, y + 2.5*scale );
      context.fill();
      context.closePath();
      me.y -= me.vector;
      me.alpha -= (me.vector / 2.9 * 3.5 / HEIGHT);
    }
  }
  window.onload = function()
  {
    start.begin();
  }
</script>
</html>