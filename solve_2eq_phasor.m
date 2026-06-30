% solve_2eq_phasor.m
% 解二元一次方程组，并将解转换为相位角形式

clear; clc;

fprintf('===== 二元一次方程组求解器（相位角形式）=====\n\n');

% ---------- 用户输入区 ----------
% 方程组形式: A * [x1; x2] = b

A = [30+107.5j,  -120j;
     4-120j,  16+120j];

b = [100;
     0];

% ---------- 求解 ----------
x = A \ b;

% ---------- 转换为相位角形式 ----------
mag   = abs(x);
phase_deg = angle(x) * 180 / pi;

% ---------- 输出 ----------
fprintf('解（直角坐标形式）:\n');
for k = 1:2
    fprintf('  x%d = %.4f %+.4fj\n', k, real(x(k)), imag(x(k)));
end

fprintf('\n解（相位角形式 / 极坐标形式）:\n');
for k = 1:2
    fprintf('  x%d = %.4f ∠ %.2f°\n', k, mag(k), phase_deg(k));
end

fprintf('\n========================================\n');

% ---------- 验证 ----------
fprintf('\n验证: 将解代回原方程\n');
b_check = A * x;
for k = 1:2
    fprintf('  方程%d: 左边 = %.4f∠%.2f°  vs  右边 = %.4f∠%.2f°\n', ...
        k, abs(b_check(k)), angle(b_check(k))*180/pi, ...
        abs(b(k)), angle(b(k))*180/pi);
end
