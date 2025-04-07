import numpy as np
import matplotlib.pyplot as plt

# Create unit circle data
theta = np.linspace(0, 2*np.pi, 100)
x = np.cos(theta)
y = np.sin(theta)

# Set vector angle
angle = 0.89777  # Angle in radians

# Vector endpoint coordinates
x_vec = np.cos(angle)
y_vec = np.sin(angle)

# Create the plot
plt.figure(figsize=(6, 6))

# Plot the unit circle
plt.plot(x, y, label="Unit Circle")
plt.axhline(0, color='black', linewidth=1)  # X-axis
plt.axvline(0, color='black', linewidth=1)  # Y-axis

# Fill quadrants with different colors
plt.fill_between(x, y, 0, where=(y >= 0) & (x >= 0), color='lightgreen', alpha=0.5)  # First quadrant
plt.fill_between(x, y, 0, where=(y >= 0) & (x < 0), color='lightblue', alpha=0.5)  # Second quadrant
plt.fill_between(x, y, 0, where=(y < 0) & (x < 0), color='lightcoral', alpha=0.5)  # Third quadrant
plt.fill_between(x, y, 0, where=(y < 0) & (x >= 0), color='lightyellow', alpha=0.5)  # Fourth quadrant

# Plot the vector
plt.quiver(0, 0, x_vec, y_vec, angles='xy', scale_units='xy', scale=1, color='red', label=f"Vector (Angle={angle:.5f} radians)")

# Add the angle label along the vector
# Adjusting the text position slightly along the vector direction
plt.text(x_vec * 0.5, y_vec * 0.05, f'{angle:.5f} rad', fontsize=12, color='red', ha='center', va='center')

# Set equal scaling to ensure the plot shows a circle
plt.gca().set_aspect('equal', adjustable='box')

# Label the quadrants
plt.text(0.5, 0.5, 'Quadrant 1', fontsize=12, color='blue', ha='center')
plt.text(-0.5, 0.5, 'Quadrant 2', fontsize=12, color='blue', ha='center')
plt.text(-0.5, -0.5, 'Quadrant 3', fontsize=12, color='blue', ha='center')
plt.text(0.5, -0.5, 'Quadrant 4', fontsize=12, color='blue', ha='center')

# Display the plot
plt.title('Unit Circle')
plt.show()  # No grid and legend
