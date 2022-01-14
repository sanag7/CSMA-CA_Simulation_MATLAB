fileID = fopen('input_network.txt','r');
formatSpec = '%f';
Input = fscanf(fileID,formatSpec); % Input about relevant info read % 
fclose(fileID);

N = Input(1); % get number of nodes *
Packet_size = Input(2) * 8; % get the packet size in bits % 
T = Input(3) * 10^-3; % get simulation time in s %
Backoff_St = Input(4); % get the random backoff strategy %

if Backoff_St == 1
% Strategy 1 %
    Next = 0;
    count = 0;
    good_time = 0;
    packet_time = 30; % get packet time %
    slot_size = 9 * (10^-6); % 9 us %
    j = 1;
    simulation_count = 0;
    CWinit = 15;
    CW = 15;
    collision_flag = 0;
    K = (randi([0,CWinit],N,1)) * 10^-6; % generate N random numbers and put them into an array %
   
    while Next < T
        
        [M,I] = min(K); % find the node with the minimum counter and index of node %
        simulation_count = simulation_count + 1;
        
        for i = 1:N   % check if there are more than one nodes with same minimum counter %
            if (M == K(i))
                count = count + 1;
                collision_index(j) = i;
                j = j + 1;
            end
        end
        
        if count > 1
            collision_flag = 1; % collision occured %
        end
        
        if collision_flag ~= 1 % if no collision, increase good time %
            good_time = good_time + packet_time;
            CW = CWinit;
            K(I) = (randi([0,CW],1,1)) * 10^-6;
        else
            CW = CW * 2;
            for i = 1:N
                if (M == K(i)) % for all nodes that collided, choose new rand %
                    K(i) = (randi([0,CW],1,1)) * 10^-6;
                end
            end
        end
        
        Next = Next + packet_time;
        
        for i = 1:N
            for j = 1:size(collision_index)
                if(i ~= collision_index(j))
                    K(i) = K(i) - slot_size;
                end
            end
        end
        count = 0;
        collision_flag = 0;
    end
    
    utility = good_time / Next;
end

if Backoff_St == 2
  % Strategy 2 %
    Next = 0;
    count = 0;
    good_time = 0;
    data_rate = 6 * 10^6; % 6 Mbps %
    packet_time = 30; % get packet time %
    slot_size = 9 * (10^-6); % 9 us %
    j = 1;
    simulation_count = 0;
    CWinit = 15;
    CW = 15;
    collision_flag = 0;
    K = (randi([0,CWinit],N,1)) * 10^-6; % generate N random numbers and put them into an array %
   
    while Next < T
        
        [M,I] = min(K); % find the node with the minimum counter and index of node %
        simulation_count = simulation_count + 1;
        
        for i = 1:N   % check if there are more than one nodes with same minimum counter %
            if (M == K(i))
                count = count + 1;
                collision_index(j) = i;
                j = j + 1;
            end
        end
        
        if count > 1
            collision_flag = 1; % collision occured %
        end
        
        if collision_flag ~= 1
            good_time = good_time + packet_time;
            CW = round(CW,2);
            K(I) = (randi([0,CW],1,1)) * 10^-6;
        else
            CW = CW + 2;
            for i = 1:N
                if (M == K(i))
                    K(i) = (randi([0,CW],1,1)) * 10^-6;
                end
            end
        end
        
        Next = Next + packet_time;
        for i = 1:N
            for j = 1:size(collision_index)
                if(i ~= collision_index(j))
                    K(i) = K(i) - slot_size;
                end
            end
        end
        count = 0;
        collision_flag = 0;
    end
    
    utility = good_time / Next;
end


if Backoff_St == 3
   % Strategy 3 %
    Next = 0;
    count = 0;
    good_time = 0;
    data_rate = 6 * 10^6; % 6 Mbps %
    packet_time = 30; % get packet time %
    slot_size = 9 * (10^-6); % 9 us %
    j = 1;
    simulation_count = 0;
    CWinit = 15;
    CW = 15;
    collision_flag = 0;
    K = (randi([0,CWinit],N,1)) * 10^-6; % generate N random numbers and put them into an array %
   
    while Next < T
        
        [M,I] = min(k); % find the node with the minimum counter and index of node %
        simulation_count = simulation_count + 1;
        
        for i = 1:N   % check if there are more than one nodes with same minimum counter %
            if (M == K(i))
                count = count + 1;
                collision_index(j) = i;
                j = j + 1;
            end
        end
        
        if count > 1
            collision_flag = 1; % collision occured %
        end
        
        if collision_flag ~= 1
            good_time = good_time + packet_time;
            CW = round(CW,2);
            K(I) = (randi([0,CW],1,1)) * 10^-6;
        else
            CW = CW * 2;
            for i = 1:N
                if (M == K(i))
                    K(i) = (randi([0,CW],1,1)) * 10^-6;
                end
            end
        end
        
        Next = Next + packet_time;
        for i = 1:N
            for j = 1:size(collision_index)
                if(i ~= collision_index(j))
                    K(i) = K(i) - slot_size;
                end
            end
        end
        count = 0;
        collision_flag = 0;
    end
    
    utility = good_time / Next;
end

if Backoff_St == 4
% Strategy 4 %
    Next = 0;
    count = 0;
    good_time = 0;
    data_rate = 6 * 10^6; % 6 Mbps %
    packet_time = 30; % get packet time %
    slot_size = 9 * (10^-6); % 9 us %
    j = 1;
    simulation_count = 0;
    CWinit = 15;
    CW = 15;
    collision_flag = 0;
    K = (randi([0,CWinit],N,1)) * 10^-6; % generate N random numbers and put them into an array %
   
    while Next < T
        
        [M,I] = min(K); % find the node with the minimum counter and index of node %
        simulation_count = simulation_count + 1;
        
        for i = 1:N   % check if there are more than one nodes with same minimum counter %
            if (M == K(i))
                count = count + 1;
                collision_index(j) = i;
                j = j + 1;
            end
        end
        
        if count > 1
            collision_flag = 1; % collision occured %
        end
        
        if collision_flag ~= 1
            good_time = good_time + packet_time;
            CW = CW - 2;
            if CW < 1
                CW = 2;
            end
            K(I) = (randi([0,CW],1,1)) * 10^-6;
        else
            CW = CW + 2;
            for i = 1:N
                if (M == K(i))
                    K(i) = (randi([0,CW],1,1)) * 10^-6;
                end
            end
        end
        
        Next = Next + packet_time;
        for i = 1:N
            for j = 1:size(collision_index)
                if(i ~= collision_index(j))
                    K(i) = K(i) - slot_size;
                end
            end
        end
        count = 0;
        collision_flag = 0;
    end
    
    utility = good_time / Next;
end

if Backoff_St == 5
    % strategy 5 %
    Next = 0;
    count = 0;
    good_time = 0;
    data_rate = 6 * 10^6; % 6 Mbps %
    packet_time = 30; % get packet time %
    slot_size = 9 * (10^-6); % 9 us %
    j = 1;
    simulation_count = 0;
    CWinit = 15;
    CW = 15;
    collision_flag = 0;
    K = (randi([0,CWinit],N,1)) * 10^-6; % generate N random numbers and put them into an array %
   
    while Next < T
        
        [M,I] = min(K); % find the node with the minimum counter and index of node %
        simulation_count = simulation_count + 1;
        
        for i = 1:N   % check if there are more than one nodes with same minimum counter %
            if (M == K(i))
                count = count + 1;
                collision_index(j) = i;
                j = j + 1;
            end
        end
        
        if count > 1
            collision_flag = 1; % collision occured %
        end
        
        if collision_flag ~= 1
            good_time = good_time + packet_time;
            CW = CW - 2;
            if CW < 1
                CW = 2;
            end
            K(I) = (randi([0,CW],1,1)) * 10^-6;
        else
            CW = CW * 2;
            for i = 1:N
                if (M == K(i))
                    K(i) = (randi([0,CW],1,1)) * 10^-6;
                end
            end
        end
        
        Next = Next + packet_time;
        for i = 1:N
            for j = 1:size(collision_index)
                if(i ~= collision_index(j))
                    K(i) = K(i) - slot_size;
                end
            end
        end
        count = 0;
        collision_flag = 0;
    end
    
    utility = good_time / Next;
end


fprintf('Number of Nodes: %d ; Simulation Time(s): %d ; Backoff Strategy: %d \n Good_Time:   ', N, T, Backoff_St);
disp(utility*100);

