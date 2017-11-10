addpath(pwd);
function mostrarTabla(boolLineal, boolParabola, boolExponencial, boolPotencial, boolHiperbola, x, y, decimal)
  erroresLineal = [];
  erroresParabola = [];
  erroresExponencial = [];
  erroresPotencial = [];
  erroresHiperbola = [];
  margen = 220;
  altura = 930;
  f = figure("position", [1, 1, 5000 1000], "name", "Tabla de Comparaciones", "numbertitle", "off");
  uicontrol (f, "style", "text", "string", "i", "position",[10 altura 20 30]);
  uicontrol (f ,"style", "text", "string", "X", "position",[80 altura 20 30]);
  uicontrol (f, "style", "text", "string", "Y", "position",[150 altura 20 30]);
  for i = 1:length(x)
    uicontrol (f, "style", "text", "string", num2str(i), "position",[10 (altura-i*50) 20 30]);
    uicontrol (f, "style", "text", "string", num2str(x(i)), "position",[80 (altura-i*50) 20 30]);
    uicontrol (f, "style", "text", "string", num2str(y(i)), "position",[150 (altura-i*50) 20 30]);
  endfor
  if(boolLineal)
      uicontrol (f, "style", "text", "string", "Lineal", "position",[margen altura 50 30]);
      res = lineal(sumaVector(x), sumaVector(y), sumaCuadradosVector(x), sumaVectorProductoXY(x, y), length(x),decimal);
      for i = 1:length(x)        
      uicontrol (f, "style", "text", "string",num2str(funcionRedondeo(res(1)*x(i) + res(2), decimal)) , "position",[margen (altura-i*50) 80 30]);
      erroresLineal(i) = abs(funcionRedondeo(y(i) - res(1)*x(i) + res(2), decimal));
    endfor
    margen = margen + 100;
  endif
  if(boolParabola)
    uicontrol (f, "style", "text", "string", "Parabola", "position",[margen altura 50 30]);
      res = parabola(length(x),sumaVector(x),sumaVector(y),sumaCuadradosVector(x),sumaCuboVector(x),sumaCuartaVector(x),sumaVectorProductoXY(x,y),sumaVectorProductoX2Y(x,y),decimal);
      for i = 1:length(x)        
      uicontrol (f, "style", "text", "string",num2str(funcionRedondeo(res(1)*x(i)*x(i) + res(2) *x(i) + res(3), decimal)) , "position",[margen (altura-i*50) 80 30]);
    endfor
    margen = margen + 100;
  endif
  
  if(boolExponencial)
    uicontrol (f, "style", "text", "string", "Exponencial", "position",[margen altura 70 30]);
      res = exponencial(length(x),sumaVector(x),sumaVector(y),sumaVector(x),sumaLogaritmo(y),sumaCuadradosVector(x),sumaVectorProductoXLnY(x,y),decimal);
      for i = 1:length(x)        
      uicontrol (f, "style", "text", "string",num2str(funcionRedondeo(res(2)*e ^(x(i)*res(1)), decimal)) , "position",[margen (altura-i*50) 80 30]);
    endfor
    margen = margen + 100;
  endif
  
  if(boolHiperbola)
    uicontrol (f, "style", "text", "string", "Hiperbolica", "position",[margen altura 70 30]);
      res = hiperbolica(length(x),sumaVector(x),sumaVector(y),sumaVector1X(x),sumaVector1X(y),sumaCuadrados1XVector(x),sumaVectorProducto1X1Y(x,y),decimal);
      for i = 1:length(x)        
      uicontrol (f, "style", "text", "string",num2str(funcionRedondeo(res(1)/(x(i)*res(2)), decimal)) , "position",[margen (altura-i*50) 80 30]);
    endfor
    margen = margen + 100;
  endif
  
  if(boolPotencial)
    uicontrol (f, "style", "text", "string", "Potencial", "position",[margen altura 70 30]);
      res =  potencial(sumaLogaritmo(x),sumaLogaritmo(y),sumaLogaritmoCuadrado(x),sumaVectorProductoLnXLnY(x,y),length(x),decimal);
      for i = 1:length(x)        
      uicontrol (f, "style", "text", "string",num2str(funcionRedondeo(res(2)*x(i) ^(x(i)*res(1)), decimal)) , "position",[margen (altura-i*50) 80 30]);
    endfor
    margen = margen + 100;
  endif
  
  
end