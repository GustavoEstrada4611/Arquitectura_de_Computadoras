import tkinter as tk
from tkinter import filedialog, messagebox

# --- Diccionario para los códigos 'funct' de instrucciones tipo R ---
# El 'opcode' para todas las instrucciones tipo R es '000000'.
R_TYPE_FUNCT = {
    "ADD": "100000",
    "SUB": "100010",
    "AND": "100100",
    "OR": "100101",
    "SLT": "101010",
    "NOR": "100111"
}

def instruccion_a_binario(instr):
    """
    Convierte una instrucción tipo R a su formato binario de 32 bits.
    Formato esperado: MNEMONIC $rd, $rs, $rt
    Ejemplo de salida para ADD $10, $3, $4:
    00000000
    01100100
    01010000
    00100000
    """
    partes = instr.replace(",", " ").strip().split()

    if len(partes) != 4:
        messagebox.showerror("Error de Formato", f"La instrucción '{instr}' debe tener un mnemónico y tres registros (ej: ADD $1 $2 $3).")
        return ""

    mnemonic = partes[0].upper()
    
    if mnemonic not in R_TYPE_FUNCT:
        messagebox.showerror("Error de Instrucción", f"El mnemónico '{mnemonic}' no es una instrucción tipo R válida o no está soportada.")
        return ""

    try:
        rd = int(partes[1].replace("$", ""))
        rs = int(partes[2].replace("$", ""))
        rt = int(partes[3].replace("$", ""))

        for reg_val, reg_name in [(rd, partes[1]), (rs, partes[2]), (rt, partes[3])]:
            if not (0 <= reg_val < 32):
                messagebox.showerror("Error de Registro", f"El valor del registro '{reg_name}' está fuera del rango permitido (0-31).")
                return ""

        rs_bin = f"{rs:05b}"
        rt_bin = f"{rt:05b}"
        rd_bin = f"{rd:05b}"

    except (ValueError, IndexError):
        messagebox.showerror("Error de Formato", f"Formato de registro inválido en '{instr}'.\nAsegúrese de usar el formato '$' seguido de un número (ej: $5).")
        return ""

    opcode = "000000"
    shamt = "00000"
    funct = R_TYPE_FUNCT[mnemonic]

    binario_32_bits = opcode + rs_bin + rt_bin + rd_bin + shamt + funct
    
    formateado = "\n".join([binario_32_bits[i:i+8] for i in range(0, 32, 8)])
    
    return formateado

def convertir():
    salida_bin.delete("1.0", tk.END)
    
    instrucciones = entrada_instr.get("1.0", tk.END).strip().split("\n")
    resultados_validos = []
    
    for linea in instrucciones:
        if linea.strip():
            resultado = instruccion_a_binario(linea)
            if resultado:
                resultados_validos.append(resultado)

    if resultados_validos:
        salida_bin.insert(tk.END, "\n\n".join(resultados_validos))
    else:
        messagebox.showwarning("Atención", "No se generó ninguna conversión válida. Revise las instrucciones.")

def guardar():
    contenido_salida = salida_bin.get("1.0", tk.END).strip()
    if not contenido_salida:
        messagebox.showwarning("Atención", "No hay nada que guardar.")
        return

    ruta = filedialog.asksaveasfilename(
        defaultextension=".txt",
        filetypes=[("Archivo de texto", "*.txt"), ("Todos los archivos", "*.*")],
        title="Guardar archivo binario"
    )
    if ruta:
        try:
            contenido_para_guardar = contenido_salida.replace("\n\n", "\n")
            with open(ruta, "w") as f:
                f.write(contenido_para_guardar)
            messagebox.showinfo("Guardado", f"El archivo se ha guardado correctamente en:\n{ruta}")
        except Exception as e:
            messagebox.showerror("Error al Guardar", f"No se pudo guardar el archivo.\nError: {e}")

def limpiar():
    entrada_instr.delete("1.0", tk.END)
    salida_bin.delete("1.0", tk.END)

ventana = tk.Tk()
ventana.title("Conversor de Instrucciones MIPS (Tipo R) a Binario")
ventana.geometry("650x500")
ventana.minsize(600, 450)
ventana.configure(bg="#f0f0f0")

main_frame = tk.Frame(ventana, padx=15, pady=15, bg="#f0f0f0")
main_frame.pack(expand=True, fill=tk.BOTH)

tk.Label(main_frame, text="Instrucciones Tipo R (una por línea):", font=("Arial", 10, "bold"), bg="#f0f0f0").pack(anchor="w")
tk.Label(main_frame, text="Formato: ADD $1, $2, $3", font=("Arial", 9), bg="#f0f0f0").pack(anchor="w", pady=(0, 5))
entrada_instr = tk.Text(main_frame, width=70, height=6, font=("Courier New", 10), relief=tk.SOLID, borderwidth=1)
entrada_instr.pack(pady=5, fill=tk.X)

tk.Label(main_frame, text="Resultado en Binario (bloques de 8-bit por línea):", font=("Arial", 10, "bold"), bg="#f0f0f0").pack(anchor="w", pady=(10, 0))
salida_bin = tk.Text(main_frame, width=70, height=8, font=("Courier New", 10), relief=tk.SOLID, borderwidth=1, bg="#e0e0e0")
salida_bin.pack(pady=5, fill=tk.X)

frame_botones = tk.Frame(main_frame, bg="#f0f0f0")
frame_botones.pack(pady=15)

button_style = {"font": ("Arial", 10, "bold"), "relief": tk.RAISED, "borderwidth": 2, "width": 12, "height": 2}

tk.Button(frame_botones, text="Convertir", command=convertir, bg="#a2d2ff", **button_style).grid(row=0, column=0, padx=10)
tk.Button(frame_botones, text="Guardar", command=guardar, bg="#bde0fe", **button_style).grid(row=0, column=1, padx=10)
tk.Button(frame_botones, text="Limpiar", command=limpiar, bg="#ffafcc", **button_style).grid(row=0, column=2, padx=10)
tk.Button(frame_botones, text="Salir", command=ventana.destroy, bg="#ffc8dd", **button_style).grid(row=0, column=3, padx=10)

ventana.mainloop()

