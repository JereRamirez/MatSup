addpath(pwd)
function  resultado = parabola(n,sumaX,sumaY,sumaX2,sumaX3,sumaX4,sumaXY,sumaX2Y,R)    
    matrizCoef=[sumaX4 sumaX3 sumaX2; sumaX3 sumaX2 sumaX ; sumaX2 sumaX n];
    matrizInv= inv(matrizCoef);
    terminosInd = [sumaX2Y;sumaXY;sumaY];
    AB = matrizInv*(terminosInd);
    a =funcionRedondeo(AB(1),R);
    b = funcionRedondeo(AB(2),R);
    c = funcionRedondeo(AB(3),R);
    resultado = [a,b,c];
endfunction


function graficarParabola(x1, x2, a, b,c)
  x = x1:0.1:x2;
  y = a*(x.^2) + b*x + c;
  l = figure(5);
  plot(x,y);  
endfunction


function redondeo = funcionRedondeo(x,n)
  a = x*(10^n);
  redondeo = (round (a)) / (10^n);
 end

%res = parabola(4,10,18,30,100,354,30,64);
%printf("Y = %dX^2+ %dX + %d\n", res(1),res(2), res(3));
%graficarParabola(0, 2.9, res(1), res(2),res(3));