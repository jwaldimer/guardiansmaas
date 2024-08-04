# Create some example services
services = [
  { name: 'Monitoreo Recorrido.cl', description: 'Monitoreo de la plataforma Recorrido.cl' },
  { name: 'Monitoreo Ecommerce', description: 'Monitoreo de la plataforma de Ecommerce' },
  { name: 'Monitoreo ERP', description: 'Monitoreo del sistema ERP' }
]

Service.destroy_all
Service.create(services)
