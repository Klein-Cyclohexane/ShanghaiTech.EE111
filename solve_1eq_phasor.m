% solve_1eq_phasor.m
% 解一元一次方程 a*x = b，并将解转换为相位角形式

clear; clc;

fprintf('===== 一元一次方程求解器（相位角形式）=====\n\n');

% ---------- 用户输入区 ----------
% 方程形式: a * x = b

a = 0.25 + 0.75j;           % 系数（复数）
b = 0.25j;  % 常数（10∠30°）

% ---------- 求解 ----------
x = b / a;

% ---------- 转换为相位角形式 ----------
mag   = abs(x);
phase_deg = angle(x) * 180 / pi;

% ---------- 输出 ----------
fprintf('方程: (%.4f%+.4fj) * x = %.4f∠%.2f°\n\n', ...
    real(a), imag(a), abs(b), angle(b)*180/pi);

fprintf('解（直角坐标形式）:\n');
fprintf('  x = %.4f %+.4fj\n\n', real(x), imag(x));

fprintf('解（相位角形式 / 极坐标形式）:\n');
fprintf('  x = %.4f ∠ %.2f°\n', mag, phase_deg);

fprintf('\n========================================\n');

% ---------- 验证 ----------
fprintf('\n验证:\n');
b_check = a * x;
fprintf('  左边 = %.4f∠%.2f°  vs  右边 = %.4f∠%.2f°\n', ...
    abs(b_check), angle(b_check)*180/pi, abs(b), angle(b)*180/pi);
