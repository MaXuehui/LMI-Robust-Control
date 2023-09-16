function res = w_noise_2D(W)
    val_W = 1/sqrt(1/W(1,1));
    index = 0;
    for i = -val_W: 0.001:val_W
        for j = -val_W: 0.001:val_W
            if [i; j]'*inv(W)*[i; j]<=1
                index = index+1;
                Noise_ellips_norm2(:,index) = [i; j];
            end
        end
    end
    res_index = randi(index,1,1);
    res =  Noise_ellips_norm2(:,res_index);
end