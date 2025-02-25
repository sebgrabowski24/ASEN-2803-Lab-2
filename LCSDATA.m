function [DataParsed] = LCSDATA(Data)
tolerance = 1;                                      % The ammount away from 0 we can expect the
                                                    % min postion to be within 


MinIndex = find(Data.Var3 < tolerance, 2);          % Find the min postion(Withing the tolerance)
SubtractAmmount = Data.Var2(MinIndex(2)) - 152.5;   % Find the ammount to subtract from the angle that would result in the min postion being 152.5
Data.Var2 = Data.Var2 - SubtractAmmount;            % Subtract said ammount from all of the angle data
MinIndex2 = find(abs(Data.Var2) == ...              % Find the value closest to zero of the new angle data
    (min(abs(Data.Var2(1:MinIndex(2))))));          
Data = Data(MinIndex2 : end, :);                    % Remove all of the rows above the value closest to zero from all of the data

[~, MaxIndex] = min(abs(Data.Var2 - 2160));         % Find the closest value to 6 revs(2160 deg)
Data = Data(1:MaxIndex, :);                         % Remove all data after the 6 revs
Data.Var1 = Data.Var1 - Data.Var1(1);               % Change time so it starts at 0

DataParsed = Data;                                  % Assign to return variable

end