addpath(pwd)
function resultado = hiperbolica(n,sumax,sumay,sumaX, sumaY, sumaX2,sumaXY,R)
    matrizCoef=[sumaX2 sumaX ; sumaX n];
    matrizInv= inv(matrizCoef);
    terminosInd = [sumaXY;sumaY];
    AB = matrizInv*(terminosInd);
    a = funcionRedondeo(1/AB(2),R);
    if(a != 0)
      b = funcionRedondeo(AB(1)/a,R);
    else
      b = 0;
    endif
   resultado = [a,b];

endfunction 

  
  function graficarHiperbolica(x1, x2, a, b)
  x = x1:0.1:x2;
  y = a ./(b+x);
  l = figure(5);
  plot(x,y);  
  
endfunction

function redondeo = funcionRedondeo(x,n)
  a = x*(10^n);
  redondeo = (round (a)) / (10^n);
 end

%Ejemplo de clase
%res = hiperbolica(4, 10, 32, 2.083, 0.642,1.424,0.409,2);
%printf("Y = %d  / (%d+X)\n", res(1), res(2));
%graficarHiperbolica(0, 2.9, res(1), res(2));