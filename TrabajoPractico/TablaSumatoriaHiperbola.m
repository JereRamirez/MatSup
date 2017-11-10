funcionesHiperbolica
 addpath(pwd);

function mostrarTablaHiperbola(x, y, decimal)
  margen = 220;
  altura = 930;
  totalY = 0;
  totalCuadradoX = 0;
  totalXY = 0;
  res = hiperbolica(length(x),sumaVector(x),sumaVector(y),sumaVector1X(x),sumaVector1X(y),sumaCuadrados1XVector(x),sumaVectorProducto1X1Y(x,y),decimal);
  f = figure("position", [1, 1, 5000 1000], "name", "Tabla de funcion hiperbolica", "numbertitle", "off");
  uicontrol (f, "style", "text", "string", "i", "position",[10 altura 20 30]);
  uicontrol (f ,"style", "text", "string", "x", "position",[80 altura 20 30]);
  uicontrol (f, "style", "text", "string", "y", "position",[150 altura 20 30]);
  uicontrol (f, "style", "text", "string", "X=x)", "position",[220 altura 20 30]);
  uicontrol (f, "style", "text", "string", "Y=1/y", "position",[290 altura 20 30]);
  uicontrol (f, "style", "text", "string", "X^2", "position",[360 altura 20 30]);
  uicontrol (f, "style", "text", "string", "X*Y", "position",[430 altura 20 30]);
  for i = 1:length(x)
    totalY += (funcionRedondeo((1/y(i), decimal)));
    totalCuadradoX += (funcionRedondeo((x(i)^2), decimal));
    totalXY += (funcionRedondeo((x(i)/y(i)), decimal));
   endfor
  for i = 1:(length(x)+1)
    uicontrol (f, "style", "text", "string", num2str(i), "position",[10 (altura-i*50) 20 30]);
    uicontrol (f, "style", "text", "string", num2str(x(i)), "position",[80 (altura-i*50) 20 30]);
    uicontrol (f, "style", "text", "string", num2str(y(i)), "position",[150 (altura-i*50) 20 30]);
    uicontrol (f, "style", "text", "string", num2str(x(i)), "position",[220 (altura-i*50) 20 30]);
    uicontrol (f, "style", "text", "string", num2str(funcionRedondeo((1/y(i)), decimal)), "position",[290 (altura-i*50) 20 30]);
    uicontrol (f, "style", "text", "string", num2str(funcionRedondeo((x(i)^2), decimal)), "position",[360 (altura-i*50) 20 30]);
    uicontrol (f, "style", "text", "string", num2str(funcionRedondeo((x(i)/y(i)), decimal)), "position",[430 (altura-i*50) 20 30]);
    if(i==(length(x)+1))
      uicontrol (f, "style", "text", "string", "Total", "position",[10 (altura-i*50) 20 30]);
      uicontrol (f, "style", "text", "string", num2str(sum(x)), "position",[80 (altura-i*50) 20 30]);
      uicontrol (f, "style", "text", "string", num2str(sum(y)), "position",[150 (altura-i*50) 20 30]);
      uicontrol (f, "style", "text", "string", num2str(sum(x)), "position",[220 (altura-i*50) 20 30]);
      uicontrol (f, "style", "text", "string", num2str(totalY), "position",[290 (altura-i*50) 20 30]);
      uicontrol (f, "style", "text", "string", num2str(totalCuadradoX), "position",[360 (altura-i*50) 20 30]);
      uicontrol (f, "style", "text", "string", num2str(totalXY), "position",[430 (altura-i*50) 20 30]);
     endif
  endfor
 end