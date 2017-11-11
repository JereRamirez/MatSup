addpath(pwd);
global margen = 100;
global altura = 500;

function mostrarTabla(boolLineal, boolParabola, boolExponencial, boolHiperbola, boolPotencial, x, y, decimal)
  erroresLineal = [];
  erroresParabola = [];
  erroresExponencial = [];
  erroresPotencial = [];
  erroresHiperbola = [];
  margen = 250;
  altura = 500;
  f = figure("position", get(0,"screensize")([3,4,3,4]).*[0.1 0.2 0.8 0.7], "name", "Tabla de Comparaciones", "numbertitle", "off"); 
  uicontrol (f, "style", "text", "string", "i", "position",[10 altura 120 30]);
  uicontrol (f ,"style", "text", "string", "X", "position",[80 altura 120 30]);
  uicontrol (f, "style", "text", "string", "Y", "position",[150 altura 120 30]);
  for i = 1:length(x)
    uicontrol (f, "style", "text", "string", num2str(i), "position",[10 (altura-i*50) 120 30]);
    uicontrol (f, "style", "text", "string", num2str(x(i)), "position",[80 (altura-i*50) 120 30]);
    uicontrol (f, "style", "text", "string", num2str(y(i)), "position",[150 (altura-i*50) 120 30]);
  endfor
  if(boolLineal)
      uicontrol (f, "style", "text", "string", "Lineal", "position",[margen altura 120 30]);
      res = lineal(sumaVector(x), sumaVector(y), sumaCuadradosVector(x), sumaVectorProductoXY(x, y), length(x),decimal);
      for i = 1:length(x)        
      uicontrol (f, "style", "text", "string",num2str(funcionRedondeo(res(1)*x(i) + res(2), decimal)) , "position",[margen (altura-i*50) 120 30]);
      erroresLineal(i) = abs(y(i) - funcionRedondeo((res(1)*x(i) + res(2)), decimal));
    endfor
    margen = margen + 100;
  endif
  if(boolParabola)
    uicontrol (f, "style", "text", "string", "Parabola", "position",[margen altura 120 30]);
      res = parabola(length(x),sumaVector(x),sumaVector(y),sumaCuadradosVector(x),sumaCuboVector(x),sumaCuartaVector(x),sumaVectorProductoXY(x,y),sumaVectorProductoX2Y(x,y),decimal);
      for i = 1:length(x)        
      uicontrol (f, "style", "text", "string",num2str(funcionRedondeo(res(1)*x(i)*x(i) + res(2) *x(i) + res(3), decimal)) , "position",[margen (altura-i*50) 120 30]);
      erroresParabola(i) = abs(funcionRedondeo(y(i) - (res(1)*x(i)*x(i) + res(2) *x(i) + res(3)), decimal));
    endfor
    margen = margen + 100;
  endif
  
  if(boolExponencial)
    uicontrol (f, "style", "text", "string", "Exponencial", "position",[margen altura 120 30]);
      res = exponencial(length(x),sumaVector(x),sumaVector(y),sumaVector(x),sumaLogaritmo(y),sumaCuadradosVector(x),sumaVectorProductoXLnY(x,y),decimal);
      for i = 1:length(x)        
      uicontrol (f, "style", "text", "string",num2str(funcionRedondeo(res(2)*e ^(x(i)*res(1)), decimal)) , "position",[margen (altura-i*50) 120 30]);
    endfor
    erroresExponencial(i) = abs(y(i) - (funcionRedondeo(res(2)*e ^(x(i)*res(1)), decimal)));
    margen = margen + 100;
  endif
  
  if(boolHiperbola)
    uicontrol (f, "style", "text", "string", "Hiperbolica", "position",[margen altura 120 30]);
      res = hiperbolica(length(x),sumaVector(x),sumaVector(y),sumaVector1X(x),sumaVector1X(y),sumaCuadrados1XVector(x),sumaVectorProducto1X1Y(x,y),decimal)
      for i = 1:length(x)        
      uicontrol (f, "style", "text", "string",num2str(funcionRedondeo(res(1)/(x(i)+res(2)), decimal)) , "position",[margen (altura-i*50) 120 30]);
      erroresHiperbola(i) = abs(y(i) - funcionRedondeo(res(1)/(x(i)+res(2)), decimal));
    endfor
    margen = margen + 100;
  endif
  
  if(boolPotencial)
    uicontrol (f, "style", "text", "string", "Potencial", "position",[margen altura 120 30]);
      res =  potencial(sumaLogaritmo(x),sumaLogaritmo(y),sumaLogaritmoCuadrado(x),sumaVectorProductoLnXLnY(x,y),length(x),decimal);
      for i = 1:length(x)        
      uicontrol (f, "style", "text", "string",num2str(funcionRedondeo(res(2)*x(i) ^(x(i)*res(1)), decimal)) , "position",[margen (altura-i*50) 120 30]);
      erroresPotencial(i) = abs(y(i) - funcionRedondeo(res(2)*x(i) ^(x(i)*res(1)), decimal));
    endfor
    margen = margen + 100;
  endif
  
  %Errores
  
  if(boolLineal)
      uicontrol (f, "style", "text", "string", "Error Lineal", "position",[margen altura 120 30]);      
      for i = 1:length(x)        
      uicontrol (f, "style", "text", "string",num2str(erroresLineal(i)) , "position",[margen (altura-i*50) 120 30]);     
    endfor
    uicontrol (f, "style", "text", "string",num2str(sum(erroresLineal)) , "position",[margen (altura-(length(x)+1)*50) 120 30]);
    margen = margen + 120;
  endif
  
   if(boolParabola)
      uicontrol (f, "style", "text", "string", "Error Parabola", "position",[margen altura 120 30]);      
      for i = 1:length(x)        
      uicontrol (f, "style", "text", "string",num2str(erroresParabola(i)) , "position",[margen (altura-i*50) 120 30]);      
    endfor
    uicontrol (f, "style", "text", "string",num2str(sum(erroresParabola)) , "position",[margen (altura-(length(x)+1)*50) 120 30]);
    margen = margen + 120;
  endif
  
  if(boolExponencial)
      uicontrol (f, "style", "text", "string", "Error Exponencial", "position",[margen altura 120 30]);      
      for i = 1:length(x)        
      uicontrol (f, "style", "text", "string",num2str(erroresExponencial(i)) , "position",[margen (altura-i*50) 120 30]);      
    endfor
    uicontrol (f, "style", "text", "string",num2str(sum(erroresExponencial)) , "position",[margen (altura-(length(x)+1)*50) 120 30]);
    margen = margen + 120;
  endif  
 
  
  if(boolHiperbola)
      uicontrol (f, "style", "text", "string", "Error Hiperbola", "position",[margen altura 120 30]);      
      for i = 1:length(x)        
      uicontrol (f, "style", "text", "string",num2str(erroresHiperbola(i)) , "position",[margen (altura-i*50) 120 30]);      
    endfor
    uicontrol (f, "style", "text", "string",num2str(sum(erroresHiperbola)) , "position",[margen (altura-(length(x)+1)*50) 120 30]);
    margen = margen + 120;
  endif
  
   if(boolPotencial)
      uicontrol (f, "style", "text", "string", "Error Potencial", "position",[margen altura 120 30]);      
      for i = 1:length(x)        
      uicontrol (f, "style", "text", "string",num2str(erroresPotencial(i)) , "position",[margen (altura-i*50) 120 30]);      
    endfor
    uicontrol (f, "style", "text", "string",num2str(sum(erroresPotencial)) , "position",[margen (altura-(length(x)+1)*50) 120 30]);
    margen = margen + 120;
  endif
  
  
  minError = sum(erroresLineal) + sum(erroresParabola) + sum(erroresExponencial) + sum(erroresHiperbola) + sum(erroresPotencial);
  for i=1:2
    stringMejoresAprox = "";
    if(minError >= sum(erroresLineal) && length(erroresLineal) > 0)
      stringMejoresAprox = sprintf("%s Lineal/ ", stringMejoresAprox);
      minError = sum(erroresLineal);
    endif
    if(minError >= sum(erroresParabola) && length(erroresParabola) > 0)
      stringMejoresAprox = sprintf("%s Parabola/ ", stringMejoresAprox);
      minError = sum(erroresParabola);
    endif
    if(minError >= sum(erroresExponencial) && length(erroresExponencial) > 0)
      stringMejoresAprox = sprintf("%s Exponencial/ ", stringMejoresAprox);
      minError = sum(erroresExponencial);
    endif
    if(minError >= sum(erroresHiperbola) && length(erroresHiperbola) > 0)
      stringMejoresAprox = sprintf("%s Hiperbola/ ", stringMejoresAprox);
      minError = sum(erroresHiperbola);
    endif
    if(minError >= sum(erroresPotencial) && length(erroresPotencial) > 0)
      stringMejoresAprox = sprintf("%s Potencial/ ", stringMejoresAprox);
      minError = sum(erroresPotencial);
    endif
  endfor
  stringMejoresAprox = sprintf("Mejor/es aproximaciones: %s", stringMejoresAprox);
  uicontrol (f, "style", "text", "string", stringMejoresAprox, "position",[30 (altura-(length(x)+3)*50) (length(stringMejoresAprox)*7) 30]);
  
end

function reiniciar()
  global margen;
  global altura;
  margen = 100;
  altura = 500;
end