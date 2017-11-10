 FuncionesLineal
 addpath(pwd);

function mostrarTablaLineal(x, y, decimal)
  margen = 220;
  altura = 930;
  totalXcuadrado = 0;
  totalXY = 0;
  res = lineal(sumaVector(x), sumaVector(y), sumaCuadradosVector(x), sumaVectorProductoXY(x, y), length(x),decimal);
  f = figure("position", [1, 1, 5000 1000], "name", "Tabla de funcion lineal", "numbertitle", "off");
  uicontrol (f, "style", "text", "string", "i", "position",[10 altura 90 30]);
  uicontrol (f ,"style", "text", "string", "x", "position",[80 altura 90 30]);
  uicontrol (f, "style", "text", "string", "y", "position",[150 altura 90 30]);
  uicontrol (f, "style", "text", "string", "X^2", "position",[220 altura 90 30]);
  uicontrol (f, "style", "text", "string", "X*Y", "position",[290 altura 90 30]);
  for i = 1:length(x)
    totalXcuadrado += (funcionRedondeo((x(i)^2), decimal));
    totalXY += (funcionRedondeo((y(i)*x(i)), decimal));
   endfor    

  for i = 1:(length(x)+1)
    if(i == (length(x)+1))
      uicontrol (f, "style", "text", "string", "Total", "position",[10 (altura-i*50) 90 30]);
      uicontrol (f, "style", "text", "string", num2str(sum(x)), "position",[80 (altura-i*50) 90 30]);
      uicontrol (f, "style", "text", "string", num2str(sum(y)), "position",[150 (altura-i*50) 90 30]);
      uicontrol (f, "style", "text", "string", num2str(totalXcuadrado), "position",[220 (altura-i*50) 90 30]);
      uicontrol (f, "style", "text", "string", num2str(totalXY), "position",[290 (altura-i*50) 90 30]);
      break
     endif
    uicontrol (f, "style", "text", "string", num2str(i), "position",[10 (altura-i*50) 90 30]);
    uicontrol (f, "style", "text", "string", num2str(x(i)), "position",[80 (altura-i*50) 90 30]);
    uicontrol (f, "style", "text", "string", num2str(y(i)), "position",[150 (altura-i*50) 90 30]);
    uicontrol (f, "style", "text", "string", num2str(funcionRedondeo((x(i)^2), decimal)), "position",[220 (altura-i*50) 90 30]);
    uicontrol (f, "style", "text", "string", num2str(funcionRedondeo((y(i)*x(i)), decimal)), "position",[290 (altura-i*50) 90 30]);

  endfor
   uicontrol (f, "style", "text", "string", "Total", "position",[10 (altura-(length(x)+1)*50) 90 30]);
   uicontrol (f, "style", "text", "string", num2str(sum(x)), "position",[80 (altura-(length(x)+1)*50) 90 30]);
   uicontrol (f, "style", "text", "string", num2str(sum(y)), "position",[150 (altura-(length(x)+1)*50) 90 30]);
   uicontrol (f, "style", "text", "string", num2str(totalXcuadrado), "position",[220 (altura-(length(x)+1)*50) 90 30]);
   uicontrol (f, "style", "text", "string", num2str(totalXY), "position",[290 (altura-(length(x)+1)*50) 90 30]);
     
 end