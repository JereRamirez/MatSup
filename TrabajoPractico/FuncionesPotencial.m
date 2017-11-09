addpath(pwd)
function  resultado = potencial(sumalnX,sumalnY, sumalnXCuadrados, productolnXY, N, R) %Calcula a y b para la aproximacion potencial    
    a = funcionRedondeo(funcionRedondeo(det([productolnXY, sumalnX; sumalnY, N]),R) / funcionRedondeo(det([sumalnXCuadrados, sumalnX; sumalnX, N]),R),R);
    B = funcionRedondeo(funcionRedondeo(det([sumalnXCuadrados, productolnXY; sumalnX, sumalnY]),R) / funcionRedondeo(det([sumalnXCuadrados, sumalnX; sumalnX, N]),R),R);
    b = funcionRedondeo(e^B,R);
    resultado = [a,b];
endfunction


function graficarPotencial(x1, x2, a, b)
  x = x1:0.1:x2;
  y = b * (x.^a);
  plot(x,y);  
endfunction

function redondeo = funcionRedondeo(x,n)
  a = x*(10^n);
  redondeo = (round (a)) / (10^n);
 end
%res = potencial(9.6, 26.7, 21.1, 58.51, 5);
%printf("Y = %dx^(%dX)\n", res(2), res(1));
%graficarPotencial(0, 2.9, res(1), res(2));