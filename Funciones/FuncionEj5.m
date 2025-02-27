function varLogica = funcion_compara_matrices(m1,m2)

    [nF1, nC1] = size(m1);
    [nF2, nC2] = size(m2);

    if nF1 ~= nF2 || nC1 ~= nC2
        varLogica = false;
        disp('MATRICES DE DISTINTAS DIMENSIONES');
    else
        %mD = m1-m2; %SI LAS MATRICES FUERAN DE uint8 y la resta fuese negativa nos daria 0 y no funcionaria bien
        mD = double(m1)-double(m2); %Asi aseguramos que se haga bien

        valorMin = min(mD(:));
        valorMax = max(mD(:));

        if valorMin == valorMax && valorMin == 0
            varLogica = true;
            disp('MATRICES IGUALES');
        else
            varLogica = false;
            disp('MATRICES DIFERENTES');
        end
    end
end