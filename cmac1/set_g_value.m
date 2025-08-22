% set_g_value.m

h = gcbo;
new_val = str2num(get(h,'String'));

if isempty(new_val) | length(new_val) > 1 | new_val < 1e-3 | new_val > 9
    set(h, 'String', num2str(g_val));
    return;
else
    g_val = new_val;
end

reset_cmac
