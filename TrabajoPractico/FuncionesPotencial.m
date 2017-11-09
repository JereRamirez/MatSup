addpath(pwd)
function  resultado = potencial(sumalnX,sumalnY, sumalnXCuadrados, productolnXY, N) %Calcula a y b para la aproximacion potencial    
    a = det([productolnXY, sumalnX; sumalnY, N]) / det([sumalnXCuadrados, sumalnX; sumalnX, N]);
    B = det([sumalnXCuadrados, productolnXY; sumalnX, sumalnY]) / det([sumalnXCuadrados, sumalnX; sumalnX, N]);
    b = e^B;
    resultado = [a,b];
endfunction


function graficarPotencial(x1, x2, a, b)
  x = x1:0.1:x2;
  y = b * (x.^a);
  plot(x,y);  
endfunction


%res = potencial(9.6, 26.7, 21.1, 58.51, 5);
%printf("Y = %dx^(%dX)\n", res(2), res(1));
%graficarPotencial(0, 2.9, res(1), res(2));