// HPS-FPGA communication
// Ibrahim and Brendan


#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <string.h>
#include "hwlib.h"
#include "socal/socal.h"
#include "socal/hps.h"
#include "socal/alt_gpio.h"
#include "hps_0.h"

#define HW_REGS_BASE ( ALT_STM_OFST )
#define HW_REGS_SPAN ( 0x04000000 )
#define HW_REGS_MASK ( HW_REGS_SPAN - 1 )

int main() {

	void *virtual_base;	//virtual lw_bridge base
	int fd;	
	void *channel_1_virtual_addr; //virtual address of ch1 mem
	void *channel_2_virtual_addr; //virtual address of ch2 mem
	void *status_addr; //virtual address of scope status register
	
	ssize_t nwritten;
	char buff[5];

	unsigned int val;

	// map the address space for the LED registers into user space so we can interact with them.
	// we'll actually map in the entire CSR span of the HPS since we want to access various registers within that span
	
//read in file from /dev/mem
	if( ( fd = open( "/dev/mem", ( O_RDWR | O_SYNC ) ) ) == -1 ) {
		printf( "ERROR: could not open \"/dev/mem\"...\n" );
		return( 1 );
	}
	//get virtual address of LW_h2f base
	virtual_base = mmap( NULL, HW_REGS_SPAN, ( PROT_READ | PROT_WRITE ), MAP_SHARED, fd, HW_REGS_BASE );
	if( virtual_base == MAP_FAILED ) {
		printf( "ERROR: mmap() failed...\n" );
		close( fd );
		return 1;
	}
	close( fd ); //* This is done by me*//
	fd = open("data.txt", O_WRONLY | O_APPEND | O_CREAT, 0600); // creats a file to write in
	
//**********read statuus register*************//
	//get virtual address of address 0
	status_addr = virtual_base + ( ( unsigned long  )( ALT_LWFPGASLVS_OFST + OSCOPE_STATUS_BASE ) & ( unsigned long)( HW_REGS_MASK ) );
	val = *(uint32_t *)status_addr;
	printf("\n \n value in status reg: %X \n\n", val);
	// convert to string [buf]
	sprintf(buff, "%X\n", val);
	nwritten = write(fd, buff, strlen(buff) * sizeof(char)); // write in the file

//***********read channel 1 memory*********//
	//get virtual address of address 0
	channel_1_virtual_addr = virtual_base + ( ( unsigned long  )( ALT_LWFPGASLVS_OFST + CHANNEL_1_MEM_BASE ) & ( unsigned long)( HW_REGS_MASK ) );
	val = *(uint32_t *)channel_1_virtual_addr;
	printf("Channel 1 mem: \n ");
	printf("\n \n value @ addr 0 to 3: %X \n\n", val);
	
	sprintf(buff, "%X ", val);
	nwritten = write(fd, buff, strlen(buff) * sizeof(char)); // write in the file
	
	//add 4 to get address 4
	channel_1_virtual_addr =virtual_base + ( ( unsigned long  )( ALT_LWFPGASLVS_OFST + CHANNEL_1_MEM_BASE + 4) & ( unsigned long)( HW_REGS_MASK ) );
	val = *(uint32_t *)channel_1_virtual_addr;
	printf("\n \n value @ addr 4 to 7: %X \n\n", val);
		
	sprintf(buff, "%X ", val);
	nwritten = write(fd, buff, strlen(buff) * sizeof(char)); // write in the file
	
	//get last address why not 102450????? 102399
	channel_1_virtual_addr =virtual_base + ( ( unsigned long  )( ALT_LWFPGASLVS_OFST + CHANNEL_1_MEM_BASE + 102399) & ( unsigned long)( HW_REGS_MASK ) );
	val = *(uint8_t *)channel_1_virtual_addr;
	printf("\n \n value @ addr 102399: %X \n\n", val);
	
	sprintf(buff, "%X\n", val);
	nwritten = write(fd, buff, strlen(buff) * sizeof(char)); // write in the file


//***********read channel 2 memory*********//
	//get virtual address of address 0
	channel_2_virtual_addr = virtual_base + ( ( unsigned long  )( ALT_LWFPGASLVS_OFST + CHANNEL_2_MEM_BASE ) & ( unsigned long)( HW_REGS_MASK ) );
	val = *(uint32_t *)channel_2_virtual_addr;
	printf("Channel 2 mem: \n ");
	printf("\n \n value @ addr 0 to 3: %X \n\n", val);
		
	sprintf(buff, "%X ", val);
	nwritten = write(fd, buff, strlen(buff) * sizeof(char)); // write in the file
	
	//add 4 to get address 4
	channel_2_virtual_addr =virtual_base + ( ( unsigned long  )( ALT_LWFPGASLVS_OFST + CHANNEL_2_MEM_BASE + 4) & ( unsigned long)( HW_REGS_MASK ) );
	val = *(uint32_t *)channel_2_virtual_addr;
	printf("\n \n value @ addr 4 to 7: %X \n\n", val);
		
	sprintf(buff, "%X ", val);
	nwritten = write(fd, buff, strlen(buff) * sizeof(char)); // write in the file
	
	//get last address
	channel_2_virtual_addr =virtual_base + ( ( unsigned long  )( ALT_LWFPGASLVS_OFST + CHANNEL_2_MEM_BASE + 102399) & ( unsigned long)( HW_REGS_MASK ) );
	val = *(uint8_t *)channel_2_virtual_addr;
	printf("\n \n value @ addr 102399: %X \n\n", val);
		
	sprintf(buff, "%X\n", val);
	nwritten = write(fd, buff, strlen(buff) * sizeof(char)); // write in the file
	
	// clean up our memory mapping and exit
	if( munmap( virtual_base, HW_REGS_SPAN ) != 0 ) {
		printf( "ERROR: munmap() failed...\n" );
		close( fd );
		return 1;
	}
	close( fd );

	return 0;
}
