import win32api
import win32timezone
import schedule
import time
import datetime
import os
import sys
import logging
from pathlib import Path

# Configuração do logging
log_dir = Path(os.path.expanduser("~")) / "AppData" / "Local" / "TimeSync"
log_dir.mkdir(parents=True, exist_ok=True)
logging.basicConfig(
    filename=log_dir / "time_sync.log",
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s'
)

def sync_time():
    try:
        # Obtém o horário atual do servidor NTP
        current_time = datetime.datetime.now()
        
        # Atualiza o horário do sistema
        win32api.SetSystemTime(
            current_time.year,
            current_time.month,
            current_time.weekday(),
            current_time.day,
            current_time.hour,
            current_time.minute,
            current_time.second,
            current_time.microsecond // 1000
        )
        
        logging.info(f"Horário sincronizado com sucesso: {current_time}")
        print(f"Horário sincronizado: {current_time}")
    except Exception as e:
        logging.error(f"Erro ao sincronizar horário: {str(e)}")
        print(f"Erro ao sincronizar horário: {str(e)}")

def main():
    logging.info("Iniciando serviço de sincronização de horário")
    print("Serviço de sincronização de horário iniciado")
    
    # Sincroniza imediatamente ao iniciar
    sync_time()
    
    # Agenda a sincronização para ocorrer a cada hora
    schedule.every().hour.do(sync_time)
    
    while True:
        schedule.run_pending()
        time.sleep(60)

if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        logging.info("Serviço encerrado pelo usuário")
        print("\nServiço encerrado")
        sys.exit(0) 