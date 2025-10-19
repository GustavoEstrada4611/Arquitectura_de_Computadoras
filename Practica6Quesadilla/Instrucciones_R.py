import tkinter as tk
from tkinter import filedialog, messagebox

# --- Diccionarios de códigos ---
funct_codes = {
    "ADD": "100000",
    "SUB": "100010",
    "OR":  "100101"
}

def reg_bin(num):
    """Convierte $n a binario de 5 bits"""
    return format(int(num), '05b')

def ensamblar_instruccion(instr):
    """Convierte una línea assembly a instrucción binaria (32 bits en bytes)"""
    partes = instr.strip().replace(',', '').split()
    if len(partes) != 4:
        raise ValueError(f"Instrucción inválida: {instr}")

    op, rd, rs, rt = partes
    op = op.upper()
    if op not in funct_codes:
        raise ValueError(f"Operación no soportada: {op}")

    opcode = "000000"
    rs_bin = reg_bin(rs.replace('$', ''))
    rt_bin = reg_bin(rt.replace('$', ''))
    rd_bin = reg_bin(rd.replace('$', ''))
    shamt = "00000"
    funct = funct_codes[op]

    instr_bin = opcode + rs_bin + rt_bin + rd_bin + shamt + funct

    # Divide en bytes (8 bits) en orden big endian
    bytes_bin = [instr_bin[i:i+8] for i in range(0, 32, 8)]
    return bytes_bin

def procesar():
    entrada = text_in.get("1.0", tk.END).strip()
    if not entrada:
        messagebox.showwarning("Advertencia", "No hay instrucciones para procesar.")
        return

    instrucciones = entrada.split('\n')
    if len(instrucciones) > 64:
        messagebox.showwarning("Advertencia", "Máximo 64 instrucciones.")
        return

    salida_text.delete("1.0", tk.END)

    for instr in instrucciones:
        if instr.strip() == "":
            continue
        try:
            bytes_bin = ensamblar_instruccion(instr)
            #salida_text.insert(tk.END, f"Instrucción: {instr}\n")
            for i, b in enumerate(bytes_bin):
                salida_text.insert(tk.END, f"{b}\n")
            #salida_text.insert(tk.END, "\n")
        except ValueError as e:
            messagebox.showerror("Error", str(e))
            return

def guardar():
    contenido = salida_text.get("1.0", tk.END).strip()
    if not contenido:
        messagebox.showinfo("Información", "No hay contenido para guardar.")
        return

    archivo = filedialog.asksaveasfilename(
        defaultextension=".txt",
        filetypes=[("Archivo de texto", "*.txt")],
        title="Guardar resultado"
    )
    if archivo:
        with open(archivo, 'w') as f:
            f.write(contenido)
        messagebox.showinfo("Éxito", f"Archivo guardado en:\n{archivo}")

def limpiar():
    text_in.delete("1.0", tk.END)
    salida_text.delete("1.0", tk.END)

# --- Interfaz Tkinter ---
root = tk.Tk()
root.title("Mini Ensamblador MIPS - Tipo R (ADD, SUB, OR)")
root.geometry("750x600")

frame_in = tk.LabelFrame(root, text="Instrucciones Assembly (máx 64)")
frame_in.pack(fill="both", padx=10, pady=10, expand=True)

text_in = tk.Text(frame_in, height=10)
text_in.pack(fill="both", padx=5, pady=5, expand=True)

frame_btns = tk.Frame(root)
frame_btns.pack(pady=5)

tk.Button(frame_btns, text="Procesar", command=procesar, width=12).pack(side="left", padx=5)
tk.Button(frame_btns, text="Guardar .txt", command=guardar, width=12).pack(side="left", padx=5)
tk.Button(frame_btns, text="Limpiar", command=limpiar, width=12).pack(side="left", padx=5)
tk.Button(frame_btns, text="Salir", command=root.quit, width=12).pack(side="left", padx=5)

frame_out = tk.LabelFrame(root, text="Salida (binario en bytes)")
frame_out.pack(fill="both", padx=10, pady=10, expand=True)

salida_text = tk.Text(frame_out, height=15)
salida_text.pack(fill="both", padx=5, pady=5, expand=True)

root.mainloop()